Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E41C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 05:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qOYsZmmksudiGHBohCsP8EyskKRBo7Ac+jJyZI/WFCI=; b=YfjpPbQSso5wSN
	SihWTAajWGUSduDVYtvsOuvuCW/pmQ51uA4GRrLDD8WSl3b+3/cI8Irn1im8Wg7dic4UvlalJiidZ
	R3enMXEJcXrB5GInfuqchwr7cgB+waDOVZqIDYXEzvPnxYtxWymdzwv9O4I/rp3LyprnLzg2R75dW
	vw9C/EKSgF+X6FqoBbKFv8eNKpn6NXvZCE6lQ+CpXlSvzgf6WNeMg8lr4nqgIC8LM03Ipcbw4aN7C
	HmY1qLdTerP6nnSBeVpeLwdSBCFw6A8IfAy4Ud0HMuYi8JbjEfOiFcADPUdJzUUx+YSgF9LbV9hDw
	ouON91jzKadYVT32+sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE0uf-0025dr-0F;
	Fri, 15 Dec 2023 05:39:05 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE0uc-0025bg-0H
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 05:39:03 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso280155a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 21:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702618740; x=1703223540; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vV6k6Fkf1zGeYnG+LwbzgUEhP05ecy2yUGe65fxGGFc=;
        b=NgsHixgelZuIGLKV5ERWKlyOExg3Sq8IqG4NpAsWAYrKrlo6LR3EaY8vUSy0B9kFUQ
         G7r0tR0Q3yUUhszLU5OLzedHIIYo8ffgZAZZ+ppD11nX8KtWG+wSTi43u2L3pyDecLaG
         UeIk8OXHcnMmhcKc2QEQMGvUhRHlPuMTi7/Ij4iZIih9etmCqZJ4lo4femklMgzEebwa
         Qnuwr0W7JdhinkA0N5wT4oM6ORlVupsGQEhcFZp83UzYWco2Blh6Wh5Wt49lpUOYmBwC
         O/UB806j+faR8L6Wf4jOyfsl2/JLgnWrbJ/pMcndpJ4QQ07Hvv6/NMsS9K5t6v3RLcDq
         d/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702618740; x=1703223540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vV6k6Fkf1zGeYnG+LwbzgUEhP05ecy2yUGe65fxGGFc=;
        b=rzqhizLqmdeinY7G9/7WnE84Qhwp3VncR15ZMj5AstVbQw7CbU7OEMgbAxh/QBYYRJ
         nDjS37D8+ETd+ucRzYtrJUSAWmkJqYuPbvYb72WsYdfkuNGCIHI/K2AH+i9BpqDz+Xsq
         L/LpiBldY9nMCoGYjMMTOZyzIIiSoifTEDiPccVpkFl0wO6SBwdptpfWp7pCaesikKWK
         p6yRjiXCCFVJeWOVWhnzsT6DCT3EJkjOWMjJF9eZ419PmV7S/PqNLmopDiL0E/SZSxGU
         X12/i8zTGPfNAmtcknop1rkz1retUhOymrYlXmdxzXJ+2DFiNuKYO1MXwmUjYP07awYY
         l7zg==
X-Gm-Message-State: AOJu0Yyfn22qUjzUBHt5wBzqQtGtnsRxrW2J3Wdpoi2TEVBqGcVjuyLk
	yku+WtUoEO9D2Itim20LF1Y6bwEJm9+mawQQRlC5DA==
X-Google-Smtp-Source: AGHT+IG+Fb3ZYO0u7bbyiooMvcQHR8wrEQ7/sQGQ+UlaI2KFAdSrc8MnMOG61PoyxvLBI/rlO4ZmrauaySWJxDXAoVk=
X-Received: by 2002:a05:6a20:d386:b0:190:1e0c:d29 with SMTP id
 iq6-20020a056a20d38600b001901e0c0d29mr18276788pzb.4.1702618740539; Thu, 14
 Dec 2023 21:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-17-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-17-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 11:08:47 +0530
Message-ID: <CAAhSdy3UxqriE+9E+To8ioDEpzzCp-GQ4ZfMpCxHYHJ=+u9p6Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] RISC-V: Add SBI STA extension definitions
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_213902_122319_A1FC03F7 
X-CRM114-Status: GOOD (  12.26  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gVGhlIFNCSSBTVEEgZXh0ZW5zaW9uIGVuYWJsZXMg
c3RlYWwtdGltZSBhY2NvdW50aW5nLiBBZGQgdGhlCj4gZGVmaW5pdGlvbnMgaXQgc3BlY2lmaWVz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNv
bT4KPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNv
bT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggfCAx
NyArKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3NiaS5oCj4gaW5kZXggMDg5MmY0NDIxYmM0Li5iNmY4OThjNTY5NDAgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAo+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vc2JpLmgKPiBAQCAtMzEsNiArMzEsNyBAQCBlbnVtIHNiaV9leHRfaWQg
ewo+ICAgICAgICAgU0JJX0VYVF9TUlNUID0gMHg1MzUyNTM1NCwKPiAgICAgICAgIFNCSV9FWFRf
UE1VID0gMHg1MDRENTUsCj4gICAgICAgICBTQklfRVhUX0RCQ04gPSAweDQ0NDI0MzRFLAo+ICsg
ICAgICAgU0JJX0VYVF9TVEEgPSAweDUzNTQ0MSwKPgo+ICAgICAgICAgLyogRXhwZXJpbWVudGFs
cyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCj4gICAgICAgICBTQklf
RVhUX0VYUEVSSU1FTlRBTF9TVEFSVCA9IDB4MDgwMDAwMDAsCj4gQEAgLTI0Myw2ICsyNDQsMjIg
QEAgZW51bSBzYmlfZXh0X2RiY25fZmlkIHsKPiAgICAgICAgIFNCSV9FWFRfREJDTl9DT05TT0xF
X1dSSVRFX0JZVEUgPSAyLAo+ICB9Owo+Cj4gKy8qIFNCSSBTVEEgKHN0ZWFsLXRpbWUgYWNjb3Vu
dGluZykgZXh0ZW5zaW9uICovCj4gK2VudW0gc2JpX2V4dF9zdGFfZmlkIHsKPiArICAgICAgIFNC
SV9FWFRfU1RBX1NURUFMX1RJTUVfU0VUX1NITUVNID0gMCwKPiArfTsKPiArCj4gK3N0cnVjdCBz
Ymlfc3RhX3N0cnVjdCB7Cj4gKyAgICAgICBfX2xlMzIgc2VxdWVuY2U7Cj4gKyAgICAgICBfX2xl
MzIgZmxhZ3M7Cj4gKyAgICAgICBfX2xlNjQgc3RlYWw7Cj4gKyAgICAgICB1OCBwcmVlbXB0ZWQ7
Cj4gKyAgICAgICB1OCBwYWRbNDddOwo+ICt9IF9fcGFja2VkOwo+ICsKPiArI2RlZmluZSBTQklf
U1RBX1NITUVNX0RJU0FCTEUgICAgICAgICAgLTEKPiArCj4gKy8qIFNCSSBzcGVjIHZlcnNpb24g
ZmllbGRzICovCj4gICNkZWZpbmUgU0JJX1NQRUNfVkVSU0lPTl9ERUZBVUxUICAgICAgIDB4MQo+
ICAjZGVmaW5lIFNCSV9TUEVDX1ZFUlNJT05fTUFKT1JfU0hJRlQgICAyNAo+ICAjZGVmaW5lIFNC
SV9TUEVDX1ZFUlNJT05fTUFKT1JfTUFTSyAgICAweDdmCj4gLS0KPiAyLjQzLjAKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
