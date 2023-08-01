Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2A6C00528
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbSOjmldsURJ8XQmYnCdwuPGDgHSDMiWbQ55aXLmYBc=; b=R2ZDY/ZMUum5b1
	2Zu0cYEZIwBu99ZaSqDDch6vjPofk3qGeGoFrURD+ErsKuBfvEMQVH5+vGJaL4pT34VmpKK/S1gjh
	jAtIvyIcX6QeD7BvrwgNp0iG0mim4zDakrRQwDMHml76DKV8T1cHynbHp7+Zj3+zPpfoKHGjwaLLm
	FBe+zptBIoTUTBkMx0AaMYJA7ZE27OvHHFWbRYqTroqOJgY4QDpSGEf/WsTA0274+oFWEpg6xhnGL
	EFssg2rtFa3k3WRjxFVXwIO+tFil+FAvkuLiuZnxjnCksjkwTExmelLI+PxAAPgIwqrIGhAysESFH
	6IgqcYQGYWV9aBSVGnJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRn-002bbd-2x;
	Tue, 01 Aug 2023 14:34:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRl-002bYQ-2c
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Aug 2023 14:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HdoX0KPTnq/UbdWq/0yaCFcTljQ6G+Wk5BUAhXk9BKk=; b=hW58Bp0dM9BLZ2kSbQ91JfD+wf
	EXd/Xsjd18UEHv9Wrr/Qa3rDqtNNIOiR/unI5M/DLkCqG7fEXi1NIZkLLG5h9Oe2X6DePgV/KluKA
	dX/qt5N7fzPmvd99KF7eWuG+Ypjo9ISz5s8ykffnqr+5CUYSrYfwlzVpxgepL55WvLoSY3FepUWtw
	wCGP8cBGicAHyCOfymhJVdBeRqwPxVz1bQbvp0iODF5Momz/ruzaN6+Hf2i/72FvHw9+uxYqSvnO+
	0sDhvlYdPUOt7rZRqJYmwQlo2z9mdlXUxpgSaU3x+ZKUAZQR9BQxoXqpxVvdzKCzFBeDaHkQzdnKd
	ZgDUSFEw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQqRf-00Eigh-0z
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 14:33:59 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8Bx5fDNF8lkhSYOAA--.33510S3;
	Tue, 01 Aug 2023 22:33:49 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxJ83MF8lkyBdEAA--.44246S3;
	Tue, 01 Aug 2023 22:33:48 +0800 (CST)
Message-ID: <9f6ff24b-7e58-2dde-3b6d-eda9be1944ae@loongson.cn>
Date: Tue, 1 Aug 2023 22:33:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v1,v1,5/7] drm/vs: Register DRM device
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
Content-Language: en-US
In-Reply-To: <6b776c23-9cc1-5a7d-0a85-bd7eb42e847d@loongson.cn>
X-CM-TRANSID: AQAAf8DxJ83MF8lkyBdEAA--.44246S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUmFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
	jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
	AS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_JF0_Jw1l4c8EcI0E
	c7CjxVAaw2AFwI0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Wr
	v_ZF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU1WEEUUUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_153356_392405_18CC4103 
X-CRM114-Status: UNSURE (   7.19  )
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

SGksCgpPbiAyMDIzLzgvMSAyMTo0MCwgc3VpamluZ2Zlbmcgd3JvdGU6Cj4+ICsjZGVmaW5lIERS
Vl9EQVRFwqDCoMKgICIyMDIzMDUxNjEiCj4KPiBUaGUgZGF0ZSBpcyBub3QgY29ycmVjdCBoZXJl
LCBnZW5lcmFsbHkgaXQgc2hvdWxkIGhhdmUgOCBudW1iZXJzLAo+Cj4gd2hpbGUgeW91IGhhdmUg
OSBkaWdpdHMsIHdoeSB5b3UgYXJlIHNvIHNwZWNpYWwgPyAKCgpJJ20gYWxzbyBpbnRlcmVzdGlu
ZyBpbiBSSVNDViBhcmNoLCBJIGdvdCBhdHRyYWN0ZWQgYnkgeW91ciBwYXRjaC4KCkkganVzdCB3
YW50IHRvIGpvaW4gaW50byB0aGUgZGlzY3Vzc2lvbiBhdCBoZXJlIChhdCBteSBzcGFyZSB0aW1l
KSwKClNvIHdoZW4geW91IHNlZSBteSBjb21tZW50cywgSSBob3BpbmcgdGhhdCB5b3Ugd2lsbCBu
b3QgaW50ZXJwcmV0IGl0IGFzIApob3N0aWxpdHkuCgpXZWxjb21lIGNvbnRyaWJ1dGluZy4gOi0p
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
