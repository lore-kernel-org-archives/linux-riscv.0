Return-Path: <SRS0=MPT1=MN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DC2C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143F92082A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  1 Oct 2018 16:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmfK/BpR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fHlYvFIH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143F92082A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=YYZ+ITqfJ7d8W6QvzgcRhuFRDXQoaaa8Kyd6ZjUwAqI=; b=pmfK/BpRViYkM7agQKL2K3MtP
	9olkGRiuU2J944ejIbhaLkpWD0XbzwNcD0faULtPFgO+cFe6V1fdZlVjFUp2liCbUCWqeeYcZu5W1
	6aJm5hAwGo2Ly2rxpHKjTQdA/F2eTozqtpzWyXZOE43WsSmUpSQt3+idH/W5CcQfMwWhgzjtyH8Bh
	TbAP3DHIFT90pyJjHT10cFHCEUMX9CMeWJrpE/RzVRjHw3N9eSqQ8OHlmJZDm9bAgUTLDTOYhBW5B
	acL7KpFQstzFOE9N4cgLq+NOMzsHBjywMZzZAlXO1+pBUCzpxLwpm0/4Ac5dfADA+OBSv2laTQxu0
	PitpDOZbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g71Uo-00084z-Q5; Mon, 01 Oct 2018 16:56:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g71Ul-00083U-4A
 for linux-riscv@lists.infradead.org; Mon, 01 Oct 2018 16:56:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id i4-v6so9273396pgq.9
 for <linux-riscv@lists.infradead.org>; Mon, 01 Oct 2018 09:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hmuCF8UMJj2MzU292guNXD3Nmjxf3dNbgljtQ1Ma2Ys=;
 b=fHlYvFIHDWgGDJKtWfGY3Labto2TeEVsIrwBUvBLG1n8Wt0n997NXpk+gH1JyaI3Ie
 LDLioipZg4Pn8zWtPsE+dbDHWMCi/pwGZwiksFYNfZOgM2U3tQgn2yVsL00+JmPXE/g4
 2KOp8ZfR5yCgUALy2iAQObCfG4NV58NLtVN1T5lwUATap0qD0qP1H4k//p78N8ghQ8n0
 FUqdq2Qbmwm41pgFpeK0TDrrzQD0i3wEwKWYjnCyF7oy11nc0WHlsr2c5UYtzj1kdXsE
 qoVMKV5HVy5Y9iO3q5Zfd+H9hRNwjfFtAZpTYGg74Ne+913cBkdqxhiH0yq6/3fO07nV
 wfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hmuCF8UMJj2MzU292guNXD3Nmjxf3dNbgljtQ1Ma2Ys=;
 b=r0Lj+YX4iQc2dJlkuHIDFiAuQlyaN6c3/KWheS4UtJuEaS7oEz0zXHiQS//1nJfp6p
 uBKRrt3PAg+RCXd8+oJqe1/QxPSwXmgks7dgSXUOTIe2/3CgY05iVp/mdanB10SMdl1d
 syIKn31mrBU8j/AA/WLQT5n0p1T6LVYZielFYEsGlkhbMBaC4ILpd4b6J6Uc2rLG1no3
 /ZHycgM+88DwtnaCmXYW6b8gV4P64mM+lnSq9a/TylBGtHi/B2k6WAPz1gQL/Upa3mRo
 wXxiZJQOKxxYBGT3ZGk39AHUX8/x3rxA9SdNulFLL7wFv69nDWl/RLe+J7nAEzkpoWSq
 QNqQ==
X-Gm-Message-State: ABuFfojMObU+cZiGyOmKCur1gwuwnW63NcgMXbmtwjBwgA1J1Q//O+4u
 ON/SKdNI3nIvGOuUEaHhrAw+jA==
X-Google-Smtp-Source: ACcGV613H+1c21HYUjhFEqJJbbjdfJuHVkEY5bdM9/1BN25ZPEaJjR56KEvBJccmDpKP9SAU5q78/g==
X-Received: by 2002:a17:902:8a89:: with SMTP id
 p9-v6mr12965921plo.183.1538412979875; 
 Mon, 01 Oct 2018 09:56:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w127-v6sm5332723pfd.112.2018.10.01.09.56.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Oct 2018 09:56:18 -0700 (PDT)
Date: Mon, 01 Oct 2018 09:56:18 -0700 (PDT)
X-Google-Original-Date: Mon, 01 Oct 2018 09:56:01 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Cosmetic menuconfig changes
In-Reply-To: <904aad36ec736345fc715b3f13c268f1@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-4401a1da-ed84-4aa3-b44a-c7475cd45aaa@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_095631_314525_797D8576 
X-CRM114-Status: GOOD (  14.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181001165618.TS6c2myWwmUP3D8aTCZ2l_7wlx8uAIftQb08nFXS_wA@z>

T24gU2F0LCAyOSBTZXAgMjAxOCAxMzo0NTowNSBQRFQgKC0wNzAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAxOC0wOS0yOSAwNDo0NCwgUGFsbWVyIERhYmJlbHQgzq3O
s8+BzrHPiM61Ogo+PiBPbiBXZWQsIDE5IFNlcCAyMDE4IDE1OjQ4OjE1IFBEVCAoLTA3MDApLCBt
aWNrQGljcy5mb3J0aC5nciB3cm90ZToKPj4+ICogTW92ZSB0aGUgYnVpbHQtaW4gY21kbGluZSBj
b25maWd1cmF0aW9uIG9uIGEgbmV3IG1lbnUgZW50cnkgIkJvb3QKPj4+ICAgb3B0aW9ucyIsIGl0
IGRvZXNuJ3QgbWFrZSBtdWNoIHNlbnNlIHRvIGJlIHBhcnQgb2YgdGhlIGRlYnVnaW5nCj4+PiBt
ZW51Lgo+Pj4KPj4+ICogUmVuYW1lICJLZXJuZWwgVHlwZSIgbWVudSB0byAiS2VybmVsIGZlYXR1
cmVzIiB0byBiZSBtb3JlIGNvbnNpc3RlbnQKPj4+IHdpdGgKPj4+ICAgd2hhdCBvdGhlciBhcmNo
aXRlY3R1cmVzIGFyZSB1c2luZywgcGx1cyAidHlwZSIgaXMgYSBiaXQgbWlzbGVhZGluZwo+Pj4g
aGVyZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZv
cnRoLmdyPgo+Pgo+PiBUaGlzIHNlZW1zIHJlYXNvbmFibGUgdG8gbWUuICBJJ3ZlIGFkZGVkIGl0
IHRvIG91ciBmb3ItbmV4dCBicmFuY2gsCj4+IHdlJ2xsIHNlZSBpZiBhbnlvbmUgZWxzZSBoYXMg
Y29tbWVudHMuICBUaGFua3MhCj4+Cj4+IERpZCB5b3UsIGJ5IGFueSBjaGFuY2UsIGdvIGFuZCBj
aGVjayB0byBzZWUgaWYgdGhlc2UgYm9vdCBvcHRpb25zCj4+IGFjdHVhbGx5IHdvcms/ICBXZSd2
ZSBnb3QgYSBidW5jaCBvZiBzdWJ0bHkgZGlmZmVyZW50IGJvb3QgbWV0aG9kcyBhbmQKPj4gdGhl
eSd2ZSBiZWVuIGJyb2tlbiBpbiB2YXJpb3VzIG9uZXMgYXQgdmFyaW91cyB0aW1lcywgc28gSSBh
bHdheXMgbGlrZQo+PiB0byB0cnkgYW5kIGNhdGFsb2cgd2hhdCBhY3R1YWxseSB3b3JrcyBub3cg
c28gYXQgbGVhc3QgSSBrbm93IHdoZXJlIHRvCj4+IGxvb2sgd2hlbiB0ZXN0aW5nIHRoaW5ncy4K
Pj4KPgo+IEkgYXNzdW1lZCB0aGF0IHNpbmNlIGl0IHdhcyBhbHJlYWR5IHRoZXJlIGl0IHdvcmtl
ZCBidXQgeW91IGFyZSByaWdodCwKPiBjbWRsaW5lIHdoZW4gcGFzc2VkIGZyb20gdGhlIGJvb3Rs
b2FkZXIgdGhyb3VnaCB0aGUgZ2VuZXJhdGVkIGRldmljZQo+IHRyZWUKPiAoaHR0cHM6Ly9naXRo
dWIuY29tL3Jpc2N2L3Jpc2N2LXFlbXUvYmxvYi9yaXNjdi1hbGwvaHcvcmlzY3YvdmlydC5jKQo+
IHdvcmtzIGJ1dCB3aGVuIHBhc3NlZCB0aHJvdWdoIHRoZSBjb25maWcgb3B0aW9uIGRvZXNuJ3Qu
IERvIHlvdSB3YW50IG1lCj4gdG8gc2VuZCBhIHNlcGFyYXRlIHBhdGNoIGZvciB0aGF0IG9yIHJl
LXNlbmQgdGhpcyBvbmUgYXMgd2VsbCBhcyBhCj4gc2VyaWVzID8KCkkgdGhpbmsgaXQncyBiZXR0
ZXIgdG8gc2VuZCB0aGF0IG91dCBhcyBhIHNlcGFyYXRlIHBhdGNoLiAgVGhlcmUncyByZWFsbHkg
bm8gCnJlYXNvbiB0byBjb3VwbGUgdGhlIHR3bywgaXQncyBqdXN0IHRoYXQgdGhpcyByZW1pbmRl
ZCBtZSB0aGF0IHdlIHByb2JhYmx5IGhhZCAKc29tZSBidWdzIGhlcmUuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
