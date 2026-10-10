Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8C9CA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 15:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiAznkD0lkFde149erp5AKv5Kkzs704h3Jj503NS3xs=; b=aNqFoeo4Cz1OK6
	VljoJ/HnTPFgcVBjMaq2nmGMB8Vo9x/oS6yhcW2u9ehEccO5cdKP1oA7wR19IJ8Hwm4GGbcMrttv5
	wEk0XV6JkEmm0kOMHwjRWtUettCjcetHNZXLnIgn+q20/wlnxcjlzVkhvaVDp7mtI/fhPJoISDZRL
	HyX9UZXK/HEhk8gCNYyEabnoIKUIWa7Em8MFyaUUwhKmn8mjTYsoGFKr5pdXayBr6bLRShfoTRXAJ
	CHbUcJm/TcVRsuLST98wquAAFqtlUyRv9Y69teHT/DknwFb+75pN/OksOI75gxsHJ+zlil5npSJsv
	zrqFWvAcCmlTxyuEo+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZOd-00000008Erz-1lUh;
	Sat, 10 Oct 2026 15:54:03 +0000
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZOa-00000008Erf-1Joc
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 15:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H3KHa2/o/VMC6EDqcdi1FNuJ9/qPNCRnhV5AgFomkyI=; t=1791647640; x=1792511640; 
	b=LEy+UkFkvidHOQEYgnLMvfeudSWNzbPFoddC/gMUqSy5kbSjjntGW1/suwAacuq0TA0DtQn6j5o
	VADohANjhM5knOnP8GQS64LEWZ/GAFJl33bQ8OSbyoQNFSGUecorDmPOsR8Xv07Uk2GXhTP6FuVcU
	N4Ue2dIfGqAYICUyPzk8/xTPjTll01A34s965oTtbQRqhPKw9gruuSfkC29E0gifrEBrWhjVwrPjQ
	SyVYttx/mzSJTYsZia5hvfnBOsm+awDSoTYt+Fcd4tubGvKswcWHmkaiObaNRHL/3yfddOCV7jB09
	D/pS2CoC058XeOimxxQjtljXopIxZTPCTEoA==;
Received: from mail-dy1-f175.google.com ([74.125.82.175])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xFZOZ-006RDx-JF
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 11:53:59 -0400
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35115b52125so861093eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 08:53:59 -0700 (PDT)
X-Gm-Message-State: AFq9FYKwPLLQg6q5EuPhsQoZLUjFv/UZt5g9nsbBfi6fMzCPr7vqlkS9
	cwlWAjSuqA8wSD90obVmwhwYGq37GQvh/MAHejP4F2w4cLqN4noe4MmeiyRovSMs5UTzHJvK+d8
	8ZpL7nZ+1in39NrIN0uVE2ypSb9d9ai4=
X-Received: by 2002:a05:7022:b057:10b0:160:a80f:3ed2 with SMTP id
 a92af1059eb24-16a5dbfecb9mr6463396c88.10.1791647638611; Sat, 10 Oct 2026
 08:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261009221957.760606-1-nickolai@csail.mit.edu> <asolRA3vLbKEZ1Wm@xhacker>
In-Reply-To: <asolRA3vLbKEZ1Wm@xhacker>
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
Date: Sat, 10 Oct 2026 11:53:47 -0400
X-Gmail-Original-Message-ID: <CADGQE7Hm2vnkh=n3s49XhRSa6HBG5vA4Pusd06-97GCF3uZuAg@mail.gmail.com>
X-Gm-Features: AclHuK8OBWpswoUnQNiV_qXKHgPLCSUObfgFAB-AqpsBhKNELovNo-sFkcnHWz8
Message-ID: <CADGQE7Hm2vnkh=n3s49XhRSa6HBG5vA4Pusd06-97GCF3uZuAg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix icache flush being skipped for a second mm
 mapping an exec folio
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_085401_372537_C2CFC7BF 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

T24gU2F0LCBPY3QgMTAsIDIwMjYgYXQgODowNeKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gSSBndWVzcyB0aGUgcmVwcm9kdWNlciBpcyBqdXN0IGEgc2lt
cGxlIGMgcHJvZ3JhbS4KPiBJdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjYW4gcGFzdGUgdGhl
IHJlcHJvZHVjZXIgY29kZSBpbnRvIHRoZSBjb21taXQKPiBtc2cgYXMgd2VsbC4KClN1cmUsIGFk
ZGVkIHRvIHRoZSByZXZpc2VkIHBhdGNoICh2MyBzZW50IGJ5IGVtYWlsIGp1c3Qgbm93KS4KCkkg
YWxzbyBmaXhlZCB0aGUgb3RoZXIgdHdvIGNvbW1lbnRzIHlvdSBwb2ludGVkIG91dCAodGhhbmsg
eW91KToKZW5hYmxpbmcgdGhpcyBjb2RlIG9ubHkgdW5kZXIgQ09ORklHX1NNUCwgYW5kIHVzaW5n
IGF0b21pYzY0IHRvIGdldAphdG9taWNpdHkgb24gMzItYml0IG1hY2hpbmVzLgoKTmlja29sYWku
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
