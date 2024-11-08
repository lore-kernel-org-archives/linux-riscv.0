Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4852D64097
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 22:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfR5vrjTV3HqOX8va0sM5tO04UIZJkNgvy4trfqnehU=; b=YDrQQ+jWt07TrV
	ipjCZobfm3P1VjRj1nNPknOIMfKf2IEFLe+3c01VJs6Yjdl7P56mq5f0KbSZmu71PiLZ9MrMatKOQ
	77lflpSvtLMy6Sa6cOiLl+hVqwqNzENPI6KHLWN3LGd7rnbhMkbkftEptXZKArYfbqDyB077Fr+OK
	UPUnegPf0sxOiVUwpH5aq+5Pi5WkxhkXOa4ipbQ5NNXKDCK+nMvHNw8drT34vLni60vPDw8L/Su4C
	RsaolVABa/BrmDDADEkQ+3+d2zSMvh2GQXu6WYx9kT/3w8cAAdC+rBvRRybE1RFjuUC1wIlltfh84
	LC2yGSbI262W3Rao+zaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XJA-0000000C6wM-1AFg;
	Fri, 08 Nov 2024 22:18:24 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9XHW-0000000C6m6-3xh8
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 22:16:44 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7ed9f1bcb6bso1875999a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 14:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731104202; x=1731709002; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uaaj3do0WgcvhYJadQpvcYkt1UCmFuGnFCbK8HYk0Ug=;
        b=afIJKFEBE7j6nMyCT5pXd/+CkY/MIKwZsEomo376kmnkcZmp2cFkpJZOv2LmDN1KIv
         299YbKe3VasSZ6wqOnnvhBZUvvBEQd1gHcbkvdQP9PZwQxWM4A/mxIPEblXJPaLCnFRD
         9zz1sp+p3pXC4tgQOfkPW0CnzSZ2ef9nlTrHKX80XFxpKxTnnUDaB7/Utb8wLhF6kbpH
         2YeyRho/ls3rNga3CqsTUZ94FkDYTXSJu4nic6qrAalbdrQisfyYnSNhIubAHTp/4SFW
         buK8wHq9+GrYXSpyCwmMKVxA+3Pm3emmDbk0EeU/Lb8nFu8BMO0OMASv6aYhpR8Ck+nx
         N53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731104202; x=1731709002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uaaj3do0WgcvhYJadQpvcYkt1UCmFuGnFCbK8HYk0Ug=;
        b=cKJhXRucC6PDgEdngO04+Fizi50cDIQAxskWUT5/ibXRghQPNqm17b5Y0OnySPCWZP
         0mVrxgaysqssvHIXnTRpJLuRujXrs1HAuXl+wV/d0XV6b90VpnyKlUopz3dFoup/B7ub
         n+VzGbSQaelS6VTFLE9dv7G6b9Ra86xMxhzTp1oYLdu1gPvcfCgHrHpCFsI12GckHwVP
         rn49NpeoOswo1uPUGfj/03hjcmv2T4vqLhM4rD4jF32TN/oBon3p/PjaSNpDkXzTxC7U
         OkUGK4y4Xd6NUh5bwDEc/BMcarsIYUe8hG143/TUJyz/44SU0GsX9GJKikAIbLnL0zY+
         IK9Q==
X-Forwarded-Encrypted: i=1; AJvYcCURG/NO9VRAE/pYgM3gLqE6gSQpJaj8tSwDdASZbeW1O+sHvmGGU57o+sBdv2KnssE5gJnAYvZA/XbL0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyulyhLfA6FBSpK3fda661OrGq35/lKI4+GCLidRk8h7FVJYjEu
	YPQDIDNX9pyDy3MPygUHZyATd+jRDn0Ud5VcpS43gTsTTlR6j2MUhKT0kfv6+JCJoQkkxaTAwpD
	sJEvX/ZWMm1yIQJbohPFvz36oRaA=
X-Google-Smtp-Source: AGHT+IFr1a3FxXGt2TQn87j4+wmPFvle1ga9U1gXp+ahIjPTkKoK/BgIw4v2gbb2mGVX3utUiNIdF2BfS0qdBFtor6o=
X-Received: by 2002:a17:90b:4a01:b0:2e9:2e69:ee10 with SMTP id
 98e67ed59e1d1-2e9b173d95cmr6088976a91.19.1731104200405; Fri, 08 Nov 2024
 14:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
 <a1f41f92-6bd0-48b6-a931-e7ad7aba18cc@outlook.com> <20240930-reenact-stratus-9d42d7439df4@spud>
 <d9eaaf71-dfe7-4bf8-8aee-538ee8ad9f24@outlook.com>
In-Reply-To: <d9eaaf71-dfe7-4bf8-8aee-538ee8ad9f24@outlook.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 8 Nov 2024 17:16:04 -0500
Message-ID: <CAJFTR8REgZkOVGP+Y3skYPYbdV6x3E2iMfWjg0SoSkaSxQtGig@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] riscv: Add support for xtheadvector
To: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, "charlie@rivosinc.com" <charlie@rivosinc.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_141643_010059_5F6CD175 
X-CRM114-Status: GOOD (  30.88  )
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

SGV5IFBhbG1lciB0aGVyZSBhcmUgYSBidW5jaCBvZiBtZXJnZSBhcnRpZmFjdHMgaW4gZm9yLW5l
eHQgZnJvbSB0aGlzCnNldC4gSnVzdCBsZXR0aW5nIHlvdSBrbm93LgpodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wYWxtZXIvbGludXguZ2l0L2NvbW1pdC8/
aD1mb3ItbmV4dCZpZD05NTQzN2Y4YzAyYjU5MDdiNWYyZDdkYzZjMDNlM2M3MzUyM2M1Y2Q2CgpP
biBNb24sIFNlcCAzMCwgMjAyNCBhdCAxMTo1MuKAr0FNIEFvYmEgSyA8bkV4cF8weDE3QG91dGxv
b2suY29tPiB3cm90ZToKPgo+IFRoZSBkZXZpY2V0cmVlIG5hbWUgc2hvd24gaW4gT3BlblNCSSBp
cwo+IHRoZSBvbmUgcGFja2VkIHdpdGggVS1Cb290IFNQTC4KPiBBcyB0aGUgaW1hZ2UgYnVpbGRl
ciBkaWRuJ3QgcHV0IHRoZSBrZXJuZWwKPiBkZXZpY2V0cmVlIHdpdGggdGhlIGltYWdlIHVuZGVy
IGJvb3QgcGFydGl0aW9uLAo+IFRoZSB3aG9sZSBib290IHByb2Nlc3Mgb25seSB1c2VzIHRoZSBV
LUJvb3QgZGV2aWNlIHRyZWUuCj4KPiBUaGUgcmVhc29uIHdoeSB0aGUgbG9nIHNob3dzICJOZXpo
YSIKPiBidXQgbm90ICJMaWNoZWUgUlYiIGlzIHRoYXQgdGhpcyBsb2cgaXMgcHJvZHVjZWQKPiB3
aGljaCBVLUJvb3QgcmV2aXNpb24gaXMgZDEtMjAyMi0xMC0zMSBmcm9tIHNhbXVlbCdzIHJlcG8u
Cj4gQnVpbGQgZnJvbSBkMS13aXAgY2FuIHNob3cgIkxpY2hlZSBSViIgY29ycmVjdGx5Cj4gKG1h
bnVhbGx5IGVkaXQgY29uZmlnIHRvIHNwZWNpZnkgTGljaGVlUlYgZHRiIHNob3VsZCBoYXZlIHNh
bWUgZWZmZWN0IHRob3VnaCksCj4gd2hpbGUgdGhlIGlzc3VlIHBlcnNpc3RzIHdoZW4ga2VybmVs
IGxvYWQgdG8KPiB0aGUgcHJvY2VkdXJlIHNhbWUgYXMgdGhlIGRtZXNnIG1lbnRpb25lZCBhYm92
ZS4KPgo+Cj4gQ2hlZXJzLAo+IEFvYmEgSwo+Cj4gMjAyNOW5tDnmnIgzMOaXpSDkuIvljYgxMDo1
Mzo0MCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Ogo+Cj4gPiBPbiBTdW4sIFNlcCAy
OSwgMjAyNCBhdCAxMjo0NDowN1BNICswMDAwLCBBb2JhIEsgd3JvdGU6Cj4gPj4gSGVsbG8gQ2hh
cmxpZSwKPiA+Pgo+ID4+IEkndmUgYmVlbiB3b3JraW5nIG9uIGJyaW5naW5nIHVwIHRoZSBTaXBl
ZWQgTGljaGVlIFJWIERvY2sKPiA+PiAod2hpY2ggYWxzbyB1c2VzIHRoZSBEMSBTb0MpIHdpdGgg
dGhlIGtlcm5lbCBwYXRjaGVzIHlvdSBwcm92aWRlZC4KPiA+PiBUaGUgcGF0Y2hlcyBhcHBsaWVk
IGNsZWFubHkgdG8gUGFsbWVyJ3MgZm9yLW5leHQgYnJhbmNoLAo+ID4+IGJ1dCBJJ3ZlIGVuY291
bnRlcmVkIGEgY291cGxlIG9mIGlzc3VlczoKPiA+Pgo+ID4+IDEuIFNraWZmb3MgQ29tcGlsYXRp
b24gRXJyb3IgZHVyaW5nIHRoZSBjb21waWxhdGlvbiBwcm9jZXNzIG9mIGBjZ29gOgo+ID4+IGB1
bmtub3duIHJlbG9jYXRpb24gdHlwZSAxNzsgY29tcGlsZWQgd2l0aG91dCAtZnBpYz9gCj4gPj4g
VW5mb3J0dW5hdGVseSwgSSBjbG9zZWQgdGhlIHRlcm1pbmFsIGJlZm9yZSBzYXZpbmcgdGhlIGZ1
bGwgbG9nLAo+ID4+IHNvIEkgZG9uJ3QgaGF2ZSB0aGUgY29tcGxldGUgZGV0YWlscywgYnV0IHRo
ZSByZXN1bHQgc2hvdWxkIGJlIHJlcHJvZHVjaWJsZS4KPiA+PiBXaGlsZSB0aGlzIHNob3VsZCBi
ZSBhIFNraWZmT1MgaXNzdWUsIG1lbnRpb24gaXQgaW4gY2FzZSBTa2lmZk9TIGlzIHRoZSBtZXRo
b2QKPiA+PiB0aGF0IHlvdSBtZW50aW9uZWQgZm9yIGJyaW5naW5nIHVwIHRoZSBkZXZpY2UuCj4g
Pj4KPiA+PiAyLiBJbWFnZSBCdWlsZGluZyB3aXRoIHNlaHJhZi9yaXNjdi1hcmNoLWltYWdlLWJ1
aWxkZXI6Cj4gPj4gQWZ0ZXIgYnVpbGRpbmcgdGhlIGltYWdlLCB0aGUgZGV2aWNlIGZhaWxlZCB0
byBzdGFydCBhdCBhbiBlYXJseSBzdGFnZS4KPiA+PiBJIHN1c3BlY3QgdGhpcyBtYXkgYmUgcmVs
YXRlZCB0byBpbmNvcnJlY3QgUkFNIHNpemUgZGV0ZWN0aW9uLAo+ID4+IGFzIHRoZSBib2FyZCBv
bmx5IGhhcyA1MTJNQiBvZiBSQU0uCj4gPj4gSW50ZXJlc3RpbmdseSwgdGhlIHZlbmRvciBpbWFn
ZSByZXBvcnRzIDFHQiwgYW5kIHRoZSBTaXBlZWQgd2Vic2l0ZSBhbHNvIHN0YXRlcwo+ID4+IHRo
YXQgdGhlIERvY2sgaGFzIDFHQiwgZGVzcGl0ZSB0aGVyZSBiZWluZyBubyBleHRyYSBtZW1vcnkg
YmFuayBwcmVzZW50Lgo+ID4+Cj4gPj4gWW91IGNhbiBmaW5kIHRoZSBib290IGxvZyBoZXJlOiBo
dHRwczovL2ZhcnMuZWUvYmRZay5sb2cKPiA+Pgo+ID4+IEFueSBoZWxwIHdvdWxkIGJlIGFwcHJl
Y2lhdGVkLCBhbmQgYmlnIHRoYW5rcyB0byB5b3VyIHdvcmsKPiA+PiB0byBtYWtlIHRoZSBlZmZp
Y2llbnQgcGFydCBvZiB0aGlzIGJvYXJkIHRvIHdvcmsgKGFnYWluKSEKPiA+Cj4gPiBUaGUgbG9n
IHlvdSBwb3N0ZWQgYXQgaHR0cHM6Ly9mYXJzLmVlL1hGelIgYXBwZWFycyB0byBiZSB1c2luZyB0
aGUKPiA+IGRldmljZXRyZWUgb2YgYSBOZXpoYSBub3QgdGhlIExpY2hlZSBSViBEb2NrLiBXaHkg
YXJlIHlvdSBkb2luZyB0aGF0LAo+ID4gd2hlbiB0aGUgTGljaGVlIFJWIERvY2sgaXMgc3VwcG9y
dGVkIGluIHRoZSBrZXJuZWwgYWxyZWFkeT8KPiA+Cj4gPiBDaGVlcnMsCj4gPiBDb25vci4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
