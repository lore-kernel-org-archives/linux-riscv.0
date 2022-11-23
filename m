Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E86BC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 10:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cgc/pkvUFeb+btyAQClcHnWuPUmyfr1j9r9WBAJaATY=; b=DD8WxPLk2f9k5/
	WR2wgj21VTqaJEhHgQvCF66AwGNeG7apAY6L92d2p+7IfHA2AXxRD0mRW57gHxBpaNS9JG7SiBgA7
	U7kNk8T7+X/tKz9ngaRtEAsP8z7XS3TCo9d33/w0ufFrLqy4+5Mgemand566MZrQ9LJPAw0c+BeUA
	YMQw1Ps/XAkAlOgYng2fsD4+QmtDDspTtO/rr2I2nqowM4KUTBNXW5w2yTzXA+LBotXBc5NTVZwvs
	J+OZVPmkq4KOSmfqaTzwrBk8QqAdmqy8eUHfvZKIMLSv+qHRn0G/ItzJplOKTLDHAxg1/T8+XveCK
	Wcn03B0BeY3Ctiv+vuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmrd-00GJUL-7y; Wed, 23 Nov 2022 10:20:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxmra-00GJS4-67
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 10:20:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AEBE1FB;
	Wed, 23 Nov 2022 02:20:19 -0800 (PST)
Received: from bogus (unknown [10.57.6.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35CBB3F587;
	Wed, 23 Nov 2022 02:20:10 -0800 (PST)
Date: Wed, 23 Nov 2022 10:20:07 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, conor.dooley@microchip.com,
	apatel@ventanamicro.com, anup@brainfault.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Conor Dooley <conor@kernel.org>, rafael@kernel.org,
	daniel.lezcano@linaro.org, Paul Walmsley <paul.walmsley@sifive.com>,
	aou@eecs.berkeley.edu, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@rivosinc.com
Subject: Re: [PATCH] cpuidle: riscv-sbi: Stop using non-retentive suspend
Message-ID: <20221123102007.2hrncka2nnpxp75h@bogus>
References: <mhng-6299f108-11af-4e70-9981-d7e7b3be0b9a@palmer-ri-x1c9>
 <57114829-c205-dece-abdb-1100947286d4@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57114829-c205-dece-abdb-1100947286d4@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_022018_301223_5917444C 
X-CRM114-Status: GOOD (  11.27  )
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

T24gVHVlLCBOb3YgMjIsIDIwMjIgYXQgMTE6MTE6MjNQTSAtMDYwMCwgU2FtdWVsIEhvbGxhbmQg
d3JvdGU6CgpbLi4uXQoKPiBXaGlsZSB0aGUgY29tbWVudCBpbiBpbmNsdWRlL2xpbnV4L2Nsb2Nr
Y2hpcHMuaCBhbmQgdGhlIG5hbWUgb2YgdGhlIGZsYWcKPiBpbXBseSB0aGF0IEMzU1RPUCBpcyBJ
bnRlbC1zcGVjaWZpYywgaXQgcmVhbGx5IGlzbid0LiBUaGUgZmxhZyBpcyB1c2VkCj4gb24gQVJN
LCBNSVBTLCBhbmQgUG93ZXJQQyBhcyB3ZWxsLgo+CgorMS4gSSBhZ3JlZSB0aGUgbmFtZSBpcyBj
b25mdXNpbmcgYnV0IGl0IHVzZWQgdG8ganVzdCBpbmRpY2F0ZSB0aGF0IHRoZQp0aW1lciBpcyBu
b3QgYWx3YXlzIG9uIGFuZCBjb3VsZCBzdG9wIGluIGRlZXBlciBDUFUgaWRsZSBzdGF0ZXMuIEl0
IHByb2JhYmx5CndhcyBpbnRyb2R1Y2VkIHRvIGJlIHVzZWQgb24geDg2IGZvciBDMyBzdGF0ZSBi
dXQgaXQgaXMgdXNlZCBmb3Igb3RoZXIKcHVycG9zZXMgYXMgd2VsbC4gTWF5IGJlIG9uZSBzaG91
bGQgaGF2ZSBvciBldmVuIGNhbiBub3cgcmVuYW1lIGl0IHRvCnNvbWV0aGluZyBtb3JlIGFwcHJv
cHJpYXRlLCBidXQgSSBhbSBzdXJlIGl0IG1pZ2h0IHRyaWdnZXIgc29tZSBiaWtlc2hlZGRpbmcK
ZGlzY3Vzc2lvbnMg8J+YiS4KCi0tIApSZWdhcmRzLApTdWRlZXAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
