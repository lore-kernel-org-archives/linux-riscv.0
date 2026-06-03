Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B545DCD6E4A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BtMUFWlJObk6x1dIkY0bzls5+olAEeoQqNr96bznjcQ=; b=GV8/+ovfKhIGf6
	1g+CgI8BIaJ/p+6nJr28kl6VKjJ9qRSvkD4xCTPoG0TWPFDxGLFWdbpV8wlQNxpFnCEcV2QXc8fZK
	ofXuT7FpkRBrDDG2u1bUGrmD42CI2rWnX06r1qY8KYvn4enX4V4g10m3++bAvjtOwOe3vth2g7mse
	cvokK6qtVwwlIHVcb8EXduDAuUQxm9qXNl6vsgO5qYsj4KOOieGh+Esau1jIgKXzA3R/6ZGBB8Wvj
	QA9MYpXiJoP+6B5e9s0Tbqet/JekDYSc24sx0/EkZl2ehiTr0XsE6nvS5QLHXULasvGMrj3t3JeOG
	Oxe6weeQI4B/qBFVY3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgKq-0000000EVxQ-13od;
	Wed, 03 Jun 2026 07:48:20 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgKo-0000000EVwl-154C
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:48:19 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e46524711so500722eaf.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780472897; cv=none;
        d=google.com; s=arc-20240605;
        b=dgLt4R1ImZXjDav1t8RWjQyRFaQtdVgcxxekHajuZpxwft6RtD8KKmiImCiDfV7x+n
         tnpPWdln43XmIRu1BXxQpp13nR7wBGocD/JuckUQrwMIPEUAP4JRRNreYLjJRhP/FiEO
         vBGGoaqiZNB4ACxZBkJV9ZRpJZVqlFT4YFK3QA1eUIWfII3qefwkI08HHGLTPsv4IW2x
         9af1IJQUvrrBPTX/CDkf569MblGvfkzBS6AmA8ebqVwvsTJupUjTk0jt8j99WfWaRgV9
         YYJCXM7NBQofUkYXQ+8EmhJJUV3q2vjMmxagp3DkjJOiRgJHtLlpU/fDglj1/mR1lyuY
         1CBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NJFXAkOWOXSdkGAgngKdKLlUHqJCaJJBjScmKJfD3JU=;
        fh=Zf5BtPW5r1kPSPiDrsbzrh+i53s2wA/ambUFPC4QGEk=;
        b=K3FVxYgkrEmTZ9IvB+tPu2XVmOG/znl39cNjATdviQQTAgAV1cHbrq0GfoIRZqv28J
         AEGWuyIuq3oKShEzLr0hB3/CtxUz8GDdSqM55Biuec+RhmE+D/h49T2+vbHuILizlgNw
         cAcx6JDYXdMVW4AHl7skhdnCXZJ3Mnl5YW1CNVS9Ub/yevbQeMoFJWbG7i+X0PmE5xog
         HNJRt7n0XwQVl3Uz6+ZNNWPGkmn5l9kuQAT4cfBPt1S6LUgYPWFqWx4AuX2JYeHq/ih0
         QYQsnmsxb4qLlBevBWQ7MsXCmZFB8Cf5yEZaIf7bVNAn6OhqMpQrBWVtRIEqjSmFst5I
         QSZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780472897; x=1781077697; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJFXAkOWOXSdkGAgngKdKLlUHqJCaJJBjScmKJfD3JU=;
        b=XgLcF3c0JGMrv32PaOYtuTyGHzuMTRlBL5pwAuV9tg6BuYhZTWYaWj4Ukq2NVAciuZ
         fRHqnWEz3+r6Tp6xW2/bb5uH2l4nFssUX+0crW8UAQtrK2Jtrkb4+J6L8nyXRZNFxGe+
         mpjkTSwfJ5VxxFFgp3TU9UZZHt/BP+exFlS7SthJyLFfpe34ppJbglS0eA8l6SRep/A2
         CyRv7d+/ovc5EtfND5QKPHmfuN/AAHmi4tc28RuJiGOSuY7U5IlxKhYdDLU5cWFF3eOF
         de1ggrqnU4qwRwn2LNxc1yf0yDjsZ9c5CcagxyU1qfNVn79JxSBXaO1Oj/Vk2qcSCKmB
         /rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472897; x=1781077697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJFXAkOWOXSdkGAgngKdKLlUHqJCaJJBjScmKJfD3JU=;
        b=sgjIFZCni2Ngx0haYhYVG00/6Tiy5SYnulMj13bTGRLPzRZg4/N3pssT9vHiOPLacS
         P0yNnMDMOx+0mPrLdJ4o/EBxqtOZh/16NDw5/zbRXzFZeo4SMh1/qXKpKSF2oGy8to2e
         iedzFSSL/hsuXyzmjsm41K8rIJgjJ1qiZF+wZRLzohbKcPhMNMFg3xzUvakNEZmTud+e
         9EC9CjlZyMSGeT/dzHZCZd4jMfRACKtBQr0aYtMq95JJw4sdWJBNUsQAWTEwZ/ythLX1
         XCa162lSJqxeUqS0HHGcGfqcCyqEg2IvOwai8U5ssGCPnnZ3Iwoy1fHI39aheEhSNdt6
         ikQA==
X-Forwarded-Encrypted: i=1; AFNElJ+mACmxol2pvLV+mj+LdIUX1gWZKPMVKmP/QQ8dJ4QVo+GjRaIefCj/1QNX6XflfQo+oF+q7a761Q2jEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh4PfaUeCYHeqxkFdgRzRbAlseXZ/cBPr/DS3AHIqQEjdlmRbR
	4XIAs4bCuH/o8L2rwUwNeOdXmF9ZTT/hDqDhRwhc6u+1gvHyywdVDui0Q2lednrsp8PvaP3nWY5
	aZ9wv2aY2T5koSN0UnP2UiTOTSY/4lFAlr7adpXzX+Q==
X-Gm-Gg: Acq92OFuarS2Uu4cBBt9yPE0L1KZqQuha01u+uWi1U8aN59Ex5DMoJa4w2zVUoxqsm6
	nafWZw2L4b4EFCcUScxF+iOV6gZUsDIaLakKtjHYwUE4bxIkw42iorX78P4BxkJa9dLHGG5Kra4
	Ks1lZiqxL49+nam18VQ4mXDO+ROYsGMDSnBO5cxfRVBnoZK8BiiulFS5jWALrWIp4rIMKylt/h7
	K7o/5sYfjX8xPhrGo4ilaefreSAB2ifAL9GBbNs85GchtWPABukt3Z6kyCJnksf7HnrQy5HI3ZN
	HB/6UTpuFkuGBsfVemesc7Mo3I22gccQo5qXD6kqt4aZsHFez/Hob/cUCJxqI5766OLlIAypuNK
	EE2lNoBAiulSc6ImCWTLvBGa7NHa+YxEGZ5gRQQ==
X-Received: by 2002:a05:6820:874f:b0:69d:fc2b:d880 with SMTP id
 006d021491bc7-69e47f75a11mr1145317eaf.33.1780472897025; Wed, 03 Jun 2026
 00:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260603074222.593243-1-joel@jms.id.au> <20260603074222.593243-3-joel@jms.id.au>
In-Reply-To: <20260603074222.593243-3-joel@jms.id.au>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:18:05 +0530
X-Gm-Features: AVHnY4L8FHlDWqUp2msMqOWbDKvayPpgV8kg2YS6-MlLCax8HYFjs-HXdFWrYPU
Message-ID: <CAAhSdy2emR_vKfWXeLfx6RLTgaNTASroNxhDPzkortHkhASP1Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: imsics: Add Tenstorrent Atlantis compatible
To: Joel Stanley <joel@jms.id.au>
Cc: Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004818_304613_1B422677 
X-CRM114-Status: GOOD (  11.54  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMywgMjAyNiBhdCAxOjEz4oCvUE0gSm9lbCBTdGFubGV5IDxqb2VsQGptcy5p
ZC5hdT4gd3JvdGU6Cj4KPiBBZGQgY29tcGF0aWJsZSBmb3IgSU1TSUNTIGluIFRlbnN0b3JyZW50
IEF0bGFudGlzIFNvQy4KPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBr
ZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+
CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpS
ZWdhcmRzLApBbnVwCgo+IC0tLQo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQt
Y29udHJvbGxlci9yaXNjdixpbXNpY3MueWFtbCAgIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixpbXNpY3MueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixpbXNp
Y3MueWFtbAo+IGluZGV4IGZlZWMxMjJiZGRkZS4uNDQyYjg4NzBmOWM1IDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9y
aXNjdixpbXNpY3MueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9yaXNjdixpbXNpY3MueWFtbAo+IEBAIC00OSw2ICs0OSw3
IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gZW51bToKPiAgICAgICAgICAgIC0gcWVtdSxpbXNp
Y3MKPiAgICAgICAgICAgIC0gc3BhY2VtaXQsazMtaW1zaWNzCj4gKyAgICAgICAgICAtIHRlbnN0
b3JyZW50LGF0bGFudGlzLWltc2ljcwo+ICAgICAgICAtIGNvbnN0OiByaXNjdixpbXNpY3MKPgo+
ICAgIHJlZzoKPiAtLQo+IDIuNDcuMwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
