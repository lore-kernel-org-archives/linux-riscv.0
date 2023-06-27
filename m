Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B4EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LHjJP/88iqMnnu53OIv41GBwj4iaFnHEKRVNr68TZI=; b=3kDpw+xh2lfqUW
	4t8Jas57p0E6Wbwp5jOz+h1KSCFGk2EP9qKqgi4S0C2cv1u2FhPLqUKx3IZ+htubxSsN/GISwujWr
	+PDcMky5tZ6b7YAnb94ysbHWtC9Mh5p2tLilfT+/+poWoGQeQnNT9xTi6dkwkFdtYnQcjeMk8SA48
	73+MSM+fybEeOT5jPJectYStpA1bhDG/uXxXmJq9SYXK8p4CD8Wtv+uCtfzvcD6Vxskks5nAq8Y2b
	f7FJSdcrnUAtZLQMQi0EvtIK35ueuefiBZVqvZFgl9BuOcm2sKCRtwuBbGejDAhDTm4Fe3t9A7P9T
	4lJpOEx++4RzLlGWLT5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAVV-00DVAS-38;
	Tue, 27 Jun 2023 15:21:29 +0000
Received: from 7.mo583.mail-out.ovh.net ([178.32.124.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEAVQ-00DV9A-1i
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jun 2023 15:21:28 +0000
Received: from director7.ghost.mail-out.ovh.net (unknown [10.108.1.68])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 7DDA426411
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:21:17 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-9wcxx (unknown [10.110.171.20])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 21C581FEBE
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:21:16 +0000 (UTC)
Received: from courmont.net ([37.59.142.97])
	by ghost-submission-6684bf9d7b-9wcxx with ESMTPSA
	id 66L2Cmz+mmRiIQEASvzl/A
	(envelope-from <remi@remlab.net>)
	for <linux-riscv@lists.infradead.org>; Tue, 27 Jun 2023 15:21:16 +0000
Authentication-Results: garm.ovh; auth=pass (GARM-97G002d4f44c0a-fdd7-4f76-99ec-14824f6b1feb,
                    923DF5A4D5D6DDC6A91A524DF2F2945B83EA8267) smtp.auth=postmaster@courmont.net
X-OVh-ClientIp: 87.92.194.88
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] RISC-V: add T-Head vector errata handling
Date: Tue, 27 Jun 2023 18:21:14 +0300
Message-ID: <2285267.ElGaqSPkdT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230622231305.631331-4-heiko@sntech.de>
References: <20230622231305.631331-1-heiko@sntech.de>
 <20230622231305.631331-4-heiko@sntech.de>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 18333309660401310151
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 30
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedviedrtddtgdeghecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefhvefufffkohgjfhgggfgtsehtqhertddttdejnecuhfhrohhmpeftrohmihcuffgvnhhishdqvehouhhrmhhonhhtuceorhgvmhhisehrvghmlhgrsgdrnhgvtheqnecuggftrfgrthhtvghrnhepvdefvdehgeehgeeftdejfeeluedvvdevfeeiffffveetfeelieeuudegtdfgkefhnecuffhomhgrihhnpehrvghmlhgrsgdrnhgvthenucfkphepuddvjedrtddrtddruddpkeejrdelvddrudelgedrkeekpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehrvghmihesrhgvmhhlrggsrdhnvghtqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_082124_713047_489580BE 
X-CRM114-Status: UNSURE (   7.31  )
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

TGUgcGVyamFudGFpbmEgMjMuIGtlc8Oka3V1dGEgMjAyMywgMi4xMy4wNSBFRVNUIEhlaWtvIFN0
dWVibmVyIGEgw6ljcml0IDoKPiBGcm9tOiBIZWlrbyBTdHVlYm5lciA8aGVpa28uc3R1ZWJuZXJA
dnJ1bGwuZXU+Cj4gCj4gVC1IZWFkIEM5eHggY29yZXMgaW1wbGVtZW50IGFuIG9sZGVyIHZlcnNp
b24gKDAuNy4xKSBvZiB0aGUgdmVjdG9yCj4gc3BlY2lmaWNhdGlvbi4KPiAKPiBSZWxldmFudCBj
aGFuZ2VzIGNvbmNlcm5pbmcgdGhlIGtlcm5lbCBhcmU6Cj4gLSBkaWZmZXJlbnQgcGxhY2VtZW50
IG9mIHRoZSBTUl9WUyBiaXQgZm9yIHRoZSB2ZWN0b3IgdW5pdCBzdGF0dXMKPiAtIGRpZmZlcmVu
dCBlbmNvZGluZyBvZiB0aGUgdnNldHZsaSBpbnN0cnVjdGlvbgo+IC0gZGlmZmVyZW50IGluc3Ry
dWN0aW9ucyBmb3IgbG9hZHMgYW5kIHN0b3Jlcwo+IAo+IEFuZCBhIGZpeGVkIFZMRU4gb2YgMTI4
LgoKVWx0aW1hdGVseSwgY29uZm9ybWFudCBoYXJkd2FyZSBhbHNvIGhhcyBhIGZpeGVkIFZMRU4g
b2Ygc29tZSB2YWx1ZS4KClNvIHdoeSBpcyB0aGF0IHJlbGV2YW50IGhlcmU/IGlzIHRoZSB2bGVu
YiBDU1Igbm90IGltcGxlbWVudGVkPyBBbmQgZXZlbiBpZiAKc28sIGMgdGhlIHZhbHVlIG5vdCBi
ZSByZXRyaWV2ZWQgd2l0aCB2c2V0dmxpPwoKLS0gClLDqW1pIERlbmlzLUNvdXJtb250Cmh0dHA6
Ly93d3cucmVtbGFiLm5ldC8KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
