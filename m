Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA098C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ek+yVgxJs3Woqklr9vB4HnqYvKhgIZK3WVzZy7g9scw=; b=iO7yii8u4zU40U
	ZEzKzwDbl0Gl8bCRYKiq7HtreIwP9yKEwMHlMzAJuqDgtISZWyHpW3Rz5ToZs4L4GvqF3Bve2KOKY
	fKIhWbWlwp0LvWFJ6mYrB6tKALUaJZYE97SDQA4h028l4IRyacIMPjPYe/Xz9pr1P/OKT1kG1wRxs
	nFihqXOc6FRBst2/mdfzHXmpzjmfwWif/5OvFUfi+qdyrF3IAQx5zjQrsFzvVFbW+sFxI5I8n/mgl
	QOb4xCC4pGMYsVpft76smeE83PpX0WsLNrIjdkXNjQVeGh9/ogs5W1o5BBJrP1Ospsf7130b19aai
	Aul3U5WufALFeF7K8VmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Nm-007zGl-2H;
	Wed, 19 Jul 2023 15:46:30 +0000
Received: from 10.mo584.mail-out.ovh.net ([188.165.33.109])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8RL-007mwV-1E
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:46:09 +0000
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.143.3])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 57A9121193
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 14:46:00 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-vmrfz (unknown [10.110.171.117])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 12A6A1FD18;
	Wed, 19 Jul 2023 14:45:58 +0000 (UTC)
Received: from courmont.net ([37.59.142.106])
	by ghost-submission-6684bf9d7b-vmrfz with ESMTPSA
	id hQaDOib3t2TqZgAAVw4Xwg
	(envelope-from <remi@remlab.net>); Wed, 19 Jul 2023 14:45:58 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-106R006f1f5ee59-9d59-4f77-aa40-2a724a7ea83b,
                    EAC8E2D8683B439879DFB44EAE753B92CD951686) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>,
 Jan Newger <jannewger@google.com>
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf counters
Date: Wed, 19 Jul 2023 17:45:57 +0300
Message-ID: <5951331.lOV4Wx5bFT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <CAOnJCU+W9u+HnMfjU_y9W7331Zx07eQs9R1twV0=KsBAeSMSjw@mail.gmail.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <8756384.Zvl9fuB8X0@basile.remlab.net>
 <CAOnJCU+W9u+HnMfjU_y9W7331Zx07eQs9R1twV0=KsBAeSMSjw@mail.gmail.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17809484729600317882
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrgeekgdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkfhojghfggfgtgesthhqredttddtjeenucfhrhhomheptformhhiucffvghnihhsqdevohhurhhmohhnthcuoehrvghmihesrhgvmhhlrggsrdhnvghtqeenucggtffrrghtthgvrhhnpeeuhfegfeefvdefueetleefffduuedvjeefheduueekieeltdetueetueeugfevffenucffohhmrghinheprhgvmhhlrggsrdhnvghtnecukfhppeduvdejrddtrddtrddupdekjedrledvrdduleegrdekkedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_074607_570980_A48BA1BA 
X-CRM114-Status: GOOD (  11.16  )
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

TGUga2Vza2l2aWlra29uYSAxOS4gaGVpbsOka3V1dGEgMjAyMywgMS40OC40OSBFRVNUIEF0aXNo
IFBhdHJhIGEgw6ljcml0IDoKPiA+IElzbid0IFJEVElNIHN1c2NlcHRpYmxlIHRvIGludGVyZmVy
ZW5jZSBmcm9tIHBvd2VyIG1hbmFnZW1lbnQgYW5kIENQVQo+ID4gZnJlcXVlbmN5IHNjYWxpbmc/
IEkgc3VwcG9zZSB0aGF0IFJEQ1lDTEUgbWF5IGJlaGF2ZSBkaWZmZXJlbnRseSBkZXBlbmRpbmcK
PiA+IG9uIFBNIGluICpzb21lKiBkZXNpZ25zLCBidXQgdGhhdCB3b3VsZCBzdGlsbCBiZSB3YXkg
YmV0dGVyIHRoYW4gUkRUSU1FCj4gPiBmb3IgdGhlIHB1cnBvc2UuCj4gCj4gWWVzLiBCdXQgdGhh
dCdzIHdoYXQgaXQgaXMgcHJvYmFibHkgdXNpbmcgZm9yIG90aGVyIElTQXMgPwoKQXQgbGVhc3Qg
b24gQUFyY2g2NCwgaXQgaXMgdXNpbmcgZWl0aGVyIExpbnV4IHBlcmYgY3ljbGUgY291bnRlciwg
b3IgaWYgdGhhdCAKaXMgZGlzYWJsZWQgYXQgYnVpbGQgdGltZSwgdGhlIHJhdyBQTVUgY3ljbGUg
Y291bnRlciAtIHdoaWNoIG9idmlvdXNseSBsZWFkcyAKdG8gU0lHSUxMIG9uIExpbnV4LCBqdXN0
IGxpa2UgdGhpcyBNUiB3b3VsZCBkbyB3aXRoIFJEQ1lDTEUuCgpBZ2FpbiwgSSBkbyBub3QgKnBl
cnNvbmFsbHkqIGhhdmUgb2JqZWN0aW9ucyB0byBkaXNhYmxpbmcgUkRDWUNMRSBmb3IgCnVzZXJz
cGFjZSAoc29tZWJvZHkgZWxzZSBkb2VzLCBidXQgdGhhdCdzIG5laXRoZXIgbXkgbm9yIHlvdXIg
cHJvYmxlbSkuIEkgZG8gCmhhdmUgb2JqZWN0aW9ucyB0byB0aGUgd29yZGluZyBvZiBzb21lIG9m
IHRoZSBjb21taXQgbWVzc2FnZXMgdGhvdWdoLgoKPiBNeSBwb2ludCB3YXMgaXQgc2hvdWxkIGp1
c3QgZG8gd2hhdGV2ZXIgaXQgZG9lcyBmb3Igb3RoZXIgSVNBLiBSSVNDLVYgaXMgbm8KPiBzcGVj
aWFsIGluIHRoYXQgcmVnYXJkLgoKU3VyZS4gTXkgcG9pbnQgaXMgdGhhdCBSRFRJTUUgbWF5IGJl
IGdyZWF0IGZvciwgc28gdG8gc2F5LCBzeXN0ZW0tbGV2ZWwgCmJlbmNobWFya3MuIEZvciBGRm1w
ZWcgdGhhdCBjb3VsZCBzb21ldGhpbmcgbGlrZSBob3cgbG9uZyBpdCB0YWtlcyB0byAKdHJhbnNj
b2RlIGEgdmlkZW8uIEJ1dCBpdCBkb2Vzbid0IHNlZW0gdG8gbWFrZSBtdWNoIHNlbnNlIGZvciAK
bWljcm9iZW5jaG1hcmtpbmcgb2Ygc2luZ2xlIHRocmVhZGVkIHRpZ2h0bHkgb3B0aW1pc2VkIGxv
b3BzLCBhcyBvcHBvc2VkIHRvIApSRENZQ0xFIChvciBhIHdyYXBwZXIgZm9yIFJEQ1lDTEUpLgoK
LS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6Ly93d3cucmVtbGFiLm5ldC8KCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
