Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD2CC982C0
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 20:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NUcfdafAJyyP5krQ2/cE2PWn5Xrhup1jsosYQ9Kca8=; b=qhGoZOcQVf5hGW
	qReWAjpthjZuHYevI8BRlCh3+rirEUCpjmpoG3OXFRsQUQtGdPVlw3v/dBjslpnpa2yiWazaYrm/6
	Ot8tCHvxTkB9w1wNUYf0ZvcylS7PhqgTP+eoaqn6i3GeCXwSnYB6hsp7pdNRQ6whQS35pw9/d6gUN
	TJEugnkX1m7IBjUd9IUSvZG3AxCS4Utqf2vTPam+5yzcAH245krLu3hLkpOIhPgYgwEnRn0eYXPS4
	xriInCJdsLWSLtsjxVRdU1TMSrJ53KqhwgOA1KcgVRO1IEe/6ooMTLHlzlKTF3RwqnrB+067V5kei
	bSg6Sllam+zkULAollUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqif-0000000EpOC-2WfF;
	Fri, 16 Jan 2026 20:46:57 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgqic-0000000EpNn-2zFO
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 20:46:56 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-6446704997cso2162809d50.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 12:46:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768596413; cv=none;
        d=google.com; s=arc-20240605;
        b=kMPFwzOGMZRULYH3nenhn4SJoXncQzm8sjFQtc89DNyNy813CG7VT9UgnZwHp3g4M6
         KnXqn/g5L/D9ZWwd7z1EMudJZu92sxF2zZf6OrYR91eZ5zhv9kVuv1jI00gAO2xA/quX
         bs6bBJOA+GkmGpLUQzoqjANLqF9oefLKZYrDdYY4cAM0f/FYgFItqMEnZwyf5wCvCPlK
         ULVSbampsLqQ53qMl/OvnzVsIOP92c+TfO3YGs+JQnf8YHlkg7qfESk/vI0pHBFabhOq
         BdkoU+pTJZl+JggnthRDUx8/1vQ1rtF2qiKOahpC6fkGrQBemeBK5xnoe9HHlgvy68qp
         zsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        fh=h/C3o/+B7U4kgPqKiWCHFD/WPp72SYr5PnRkI2RH9tA=;
        b=EeQfRqcS7l81nFV4nBnmPFT/uS32AyhDD2ivGoQjAfWDQM8Zgjp3XId3rPfx03A5XC
         jhvzpu7YuUJH+OoEimZ3VQMSiU3ZvdhRHCIZzqlAD0/7xGw6zHa77XsQb5aUsonU40fW
         eW47qVhZdaZlqIkuNSfwZeymEsqaT8ui1bQbsgjnWbEMmHwx6mCU3hTvfeH+I0hSH7/9
         ADTXm1bhGOrArqJ2BsBKiMneEDGlYfeocT5MVDNcNdsnQNwoHhnyZpqgUFjFn5cpArlp
         MUyci6+cp0YfnldZMbiF3xpgPgOi7MX7Tzub1sc0XAg+FkTainEWjYKBcr9oPlGKWYUw
         l+yQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768596413; x=1769201213; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        b=V6cKIOxOf/XYSnvVsl3TZzWrTDAmhyH3Z/gpOhXvkeDCiQWVjMu9/lIZ+1LukH6/Hl
         RwvC0wsxSWEzS8HJnBzdXWEQehf7Cn8SB0XvSRc4m/hP20LtnS+GURj+G6DLgew50Zt4
         7vK8pjqJEPGC6fapx8OWep+LC9btIUzBlzjRAimSONcMAbPI5efOpJo2ruKFqfYpqNLF
         8a5e5Ui7k3yvkmJEsfQrM3+g1O6B3306fOViEA0MwJblRT5OtMka+MlgpVVAac9RhOx0
         rCaDd2voz3J5gIR+MUKHgF9ZTUT0sdslUFcjYnJmZrcTWhGEq75st6M4TCSPN7GTc9UF
         WnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768596413; x=1769201213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AcNOPclJc/EhFlX0szxnG8r82N8U9VQwdVZFKPK0yLU=;
        b=h7+1o1ODIAOs4harPw0mOhnBJ0zP79kYC3RoMHXaQAbPzVV9+3NPKFFH8Qy+gmr9kv
         3EN5spN7n0YeihuQGb0UYVOefLG2GNnIQodRFx/wv4K7yEpdI5nzTv8cDUS+sX8KTKle
         AGm1rnUhz8fT9mQRIk9dAvdfy4/N4BlHIoIU3wGreiM3vRsnZ5AgTwydvXSKq9APuplm
         6OKBJ+tbhchbnxC5SSabdisSzTbqfAsBaqPBK/8m45T206plAWQln7BaKcGBejfXhlyu
         Pefh7dxlqqjFg6nOZrNiHmNVROlhpWKavzHG+9I0jDWjrEd7iD8jaEiLULDoc9Jfr+Am
         LrSg==
X-Forwarded-Encrypted: i=1; AJvYcCUfX+gbpCBkhIy/a0YQy91hASeC9J4/gG4OckWPbwTP4lW7Gy/gqVyjDLuTFI0VbDEb+9kOkgosp7H2uA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrGO4wiy7RRQs6pC5wKB5aIGeZw25ymH56Veb65rhAEP661lz7
	naD9URs00rnRi9UhRnbq8XeUHCSVp0oou2MqykxDr2ueeMCq7SbSRCrlI2AVxZ6jzI2jglTxIx8
	hrh59ke0yK83C/zvSp8IK/J3h2R5++Fq1TABMaUVQkQ==
X-Gm-Gg: AY/fxX6/2zP2LMJXCxb7btzNMWTvGneCvPDOIw8RDCMlbpIE1dCuqEl+6KxuomO1v6h
	2tm/azyS4DIeURJoZPbdMCxxtcOXwkiaoNhxaTZpdrzdC/wcRFIh1IathcrX2SuzXZbyfen1kvJ
	YraWlhO/zvnWiiWP+PQunf0C8ls598NsWm9bbtaldzJBip5VZWFraeFcqJWnx8BUt9d0j7SJYKN
	P2tHuLXe3t2gMChdyTP0MYLOb+927Tc3KD49uUWVr/gecIkVmh2uihRI1ISN14soxBdv/iI/DME
	50ziNCJ0ezIp6/URXM0e8KjPq/ugDpnA3TM3pDnnzQa5cNRe5ufYPfB0DS4x
X-Received: by 2002:a05:690e:b8a:b0:644:4259:9b64 with SMTP id
 956f58d0204a3-649164f80c1mr3486002d50.59.1768596413369; Fri, 16 Jan 2026
 12:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com> <aWmc73irBAM8DZwF@redhat.com>
In-Reply-To: <aWmc73irBAM8DZwF@redhat.com>
From: Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Date: Fri, 16 Jan 2026 14:46:41 -0600
X-Gm-Features: AZwV_QiHsFgdKPq-3jvX1L38hlBJ19C7RbwabDn7wX-L0sq8clCAb2c4AtrN_hc
Message-ID: <CAEev2e-wOYPYVMtCVZw=kQiZeXjM3ZUmsAMGG8MuM2Oo6SXE-g@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_124654_764086_418F507F 
X-CRM114-Status: GOOD (  11.66  )
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

SGkgQnJpYW4sCgpPbiBUaHUsIEphbiAxNSwgMjAyNiBhdCA4OjA14oCvUE0gQnJpYW4gTWFzbmV5
IDxibWFzbmV5QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSGkgQW5pcnVkaCwKPgo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoIQo+Cj4gUGxlYXNlIHNvcnQgdGhlIGhlYWRlcnMuIGNsay1wcm92aWRlci5o
IGlzIGxpc3RlZCB0d2ljZS4gUmVtb3ZlIHRoZQo+IHVubmVjZXNzYXJ5IG5ld2xpbmVzLgo+CgpV
bmRlcnN0b29kLCB3aWxsIGZpeCB0aGlzLCB0aGUgbmV3bGluZXMgYW5kIGFkZCB0aGUgcmV0dXJu
IFBUUl9FUlIoaHcpCnN0YXRlbWVudHMuCgo+Cj4gU2hvdWxkIHRoZSBwYXJlbnQgYmUgZGVmaW5l
ZCBpbiBkZXZpY2UgdHJlZSBpbnN0ZWFkIG9mIHN0YXRpY2FsbHkgaW4gdGhlCj4gZHJpdmVyPyBk
ZXZtX29mX2Nsa19hZGRfaHdfcHJvdmlkZXIoKSBpcyBjYWxsZWQgYmVsb3csIGFuZCBpdCBjYWxs
cwo+IG9mX2Nsa19zZXRfZGVmYXVsdHMoKSwgd2hpY2ggd2lsbCBhbGxvdyB0aGUgdXNlIG9mIHRo
ZQo+IGFzc2lnbmVkLWNsb2NrLXBhcmVudHMgYW5kIGFzc2lnbmVkLWNsb2NrcyBwcm9wZXJ0aWVz
LgoKWWVzLCB5b3UgYXJlIHJpZ2h0LiBJIHdpbGwgc3dpdGNoIGl0IG92ZXIgdG8gdGhpcy4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
