Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002BAC00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 13:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0TLr+K+UzbD59GuKA1X+/JrEhzkVQlVfX0YkQ/rXpNs=; b=nqn18K+hkme/GJ
	ERDuRnG3FviOFhPPY3iyqPH579hT7pzLOdk7f8oIZnkLnlC09uN3UUd0i9e53QckV9IMpFI08BHZA
	DB+NMx5ThnslIGgme3TmDg7Wwrng6Epv/1ghTo3rdYXvB+EkCGJZx9HcwHvi4mBH+sVP8wOOPxckQ
	1rPwFAiCUBPAA6KTjf3y5Z4mY+HznOffYtzmjTA5G1mbyU/x/o4VL27cU523HGAVwNBQwvFVRzbKx
	WXgmz+tzbaVvS7Pn3T6HJdPvlKYc7RbfCf5ikgEYI0Dkar5voUGpG6VHhKZHLlsdocU210tCqBt5i
	HSfPVpUuoaDaweLg37DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQppG-002V5Z-1L;
	Tue, 01 Aug 2023 13:54:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQppF-002V3U-00
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Aug 2023 13:54:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=j/4/SokcBLp/vtOTc1E8lDWUMnoH5eE6JRwvEYoGIcM=; b=DZ4XM+5hofxpBufhUl7qNLsGaM
	L38xYanX4TE31maOTO9QcaTQZVYQfcKn33eODpZGsGvrNKuPHYsfOISuwhemwa2YnzZtFa7yWUmyE
	fleG+kRqN1kOLpd74u5+cX9wya6EjQNabkYcHC7Uo6n1n5TACE60NCHvkhPa0mfm5Y5BpkBue5zpr
	ooE5sV13adnwnS70XPLfoTAE3gqKUc8yrKAu4QraN9kY0BgrkAJIVSOvTxxaFQxV5hngpKW3RkD19
	MI/SCPHgRAMMif9wpUQpFeD8dCY9IIBRgRQdmbsp9eOki2AYf09m9qwunjgRGIvUrVFfsVNWYiPyT
	7ye87fFA==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qQpp1-009BMe-RC
	for linux-riscv@lists.infradead.org; Tue, 01 Aug 2023 13:54:02 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8CxNvFjDslkdyEOAA--.33391S3;
	Tue, 01 Aug 2023 21:53:39 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriNiDslkGQxEAA--.5911S3;
	Tue, 01 Aug 2023 21:53:38 +0800 (CST)
Message-ID: <00f8d896-7465-384c-dd94-823ad5524e50@loongson.cn>
Date: Tue, 1 Aug 2023 21:53:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v1,v1,5/7] drm/vs: Register DRM device
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
References: <20230801101030.2040-6-keith.zhao@starfivetech.com>
 <6b776c23-9cc1-5a7d-0a85-bd7eb42e847d@loongson.cn>
In-Reply-To: <6b776c23-9cc1-5a7d-0a85-bd7eb42e847d@loongson.cn>
X-CM-TRANSID: AQAAf8CxriNiDslkGQxEAA--.5911S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFyrXryxJw15Aw17Zr1rKrX_yoW3ArbEyw
	sYqr18W3W8JFWUJF1UtFn3ZryIqryj9as5Jay5Ar15Z3W7Xrsavan8JwnYvr4Ygan7G3Wf
	Grs8ur1fAa47XosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbqAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY
	6Fy7McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
	1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWrXVW3AwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
	JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUVU73DU
	UUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_145400_524036_F27628A1 
X-CRM114-Status: UNSURE (   6.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDIzLzgvMSAyMTo0MCwgc3VpamluZ2Zlbmcgd3JvdGU6Cj4+ICtpZiBEUk1fVkVS
SVNJTElDT04KPj4gKwo+PiArY29uZmlnIFNUQVJGSVZFX0hETUkKPj4gK8KgwqDCoCBib29sICJT
dGFyZml2ZSBzcGVjaWZpYyBleHRlbnNpb25zIEhETUkiCj4+ICvCoMKgwqAgaGVscAo+PiArwqDC
oMKgwqDCoMKgIFRoaXMgc2VsZWN0cyBzdXBwb3J0IGZvciBTdGFyRml2ZSBTb0Mgc3BlY2lmaWMg
ZXh0ZW5zaW9ucwo+PiArwqDCoMKgwqDCoMKgIGZvciB0aGUgSW5ub3NpbGljb24gSERNSSBkcml2
ZXIuIElmIHlvdSB3YW50IHRvIGVuYWJsZQo+PiArwqDCoMKgwqDCoMKgIEhETUkgb24gSkg3MTEw
IGJhc2VkIFNvQywgeW91IHNob3VsZCBzZWxlY3QgdGhpcyBvcHRpb24uCj4+ICsKPj4gK8KgwqDC
oMKgwqDCoCBUbyBjb21waWxlIHRoaXMgZHJpdmVyIGFzIGEgbW9kdWxlLCBjaG9vc2UgTSBoZXJl
Lgo+PiArZW5kaWYKPgo+IFdoeSBub3QgdXNlIAoKIMKgV2h5IG5vdCB1c2UgdGhlICdkZXBlbmRz
IG9uIERSTV9WRVJJU0lMSUNPTifCoCBoZXJlID8KCgpgYGAKCmNvbmZpZyBTVEFSRklWRV9IRE1J
CgogwqDCoCDCoGRlcGVuZHMgb24gRFJNX1ZFUklTSUxJQ09OCiDCoMKgIMKgYm9vbCAiU3RhcmZp
dmUgc3BlY2lmaWMgZXh0ZW5zaW9ucyBIRE1JIgoKIMKgwqAgwqBoZWxwCgpgYGAKCgpJIHNlZSB0
aGUgS2NvbmZpZyBvZiBWQzQgdXNpbmcgdGhlICdkZXBlbmRzIG9uJywgYW5kIG1vc3TCoCBkcml2
ZXIgdXNpbmcgCnRoZSAnZGVwZW5kcyBvbicKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
