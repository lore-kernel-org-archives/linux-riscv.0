Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7141EE4996
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Aug 2023 02:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vA/WuqtkOcgBNDM95MZdMxeTl80DGgFZG2IHz46wwYs=; b=0r4GyRVnBlOrjy
	CwV+pUO+/BTsoxrBFshTDVOTBoeauzWrScBpn5DBecLnqbgG/sssZ6O8oSRH7JvGuRGqyqQjZvBHs
	ySsa5bReidEWvrG0AntpaWm+PfzuQEZlIuUaYL728M80s7euub8vw6OMY3DBuRxwiEE6O3PzHL5Oc
	icgltvsflnZgWcxfddz00BdPLmu/ldBZxsSsHzxJi90khDSE2N/kG9JrYg7HuJTRmASNmVuW/uzAu
	pAQqIrYESq5WLYsYnS1IoHFnhtD3lsZNHnftoA25fWTsfLalkHKM+Vd+PUYnIpHrSFFC1GAx+cXGK
	R2dThb739s9vBEzP6tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBWq-00AHeY-1g;
	Sat, 19 Aug 2023 02:17:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXBWo-00AHeA-2e
	for linux-riscv@bombadil.infradead.org;
	Sat, 19 Aug 2023 02:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=RIHzIhi9MIOqGTQWFc0wcTMrPv3OakusDqedaGbhhkk=; b=DIUAjf6OFKOmxcqBslTr1xCuue
	hw46JMeIFnbYPKnuE2VajtCh9loyh5/QcTEkAQohmlsnehLhG4GQGdM0tFCp+gSZ6avl/7shrrty6
	iSNQIP72Z5j/V4BaeqF0/kGHEOKpaneNzW0l8uQOkPskucHsHauysSP9Nb3DkKcgNnLbxOXh8g+78
	vGXUOnkWMzotarqw5jtuFETszYsHjv20RBfXy3mskW6qWLOe6uaw8KZ9fiuneVDjEoiuX1Y9Z+yDH
	APVTN9S/jv+sINJJsRJQOhEANiFXN1rQfr9/X6GX6iYZTXF/V7Q4azjOd3RStWenj0oeQyGK7ztkj
	9Mmvxy5g==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qXBWf-00D0ST-V3
	for linux-riscv@lists.infradead.org; Sat, 19 Aug 2023 02:17:23 +0000
Received: from loongson.cn (unknown [10.20.42.43])
	by gateway (Coremail) with SMTP id _____8BxY_AjJuBk0QwaAA--.53512S3;
	Sat, 19 Aug 2023 10:17:07 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxWM0YJuBkHxFeAA--.35586S3;
	Sat, 19 Aug 2023 10:17:07 +0800 (CST)
Message-ID: <c1d090fb-b686-cd64-0452-551e27b74ec8@loongson.cn>
Date: Sat, 19 Aug 2023 10:16:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] PCI/VGA: Make the vga_is_firmware_default() less
 arch-dependent
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, loongson-kernel@lists.loongnix.cn,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230817220853.GA328159@bhelgaas>
Content-Language: en-US
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230817220853.GA328159@bhelgaas>
X-CM-TRANSID: AQAAf8CxWM0YJuBkHxFeAA--.35586S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JryDurWxuF4kAF4UXr1fuFX_yoWfXFg_uF
	Z3AFykCrWrGF1qgas8GFWrArW7GF12vws8XFWfJrnFqFy5ZayFgFZ3CryDAr1vgayrWrW5
	J34YyF1Du342gosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbx8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVWU
	JVW8JwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbI
	xvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU
	=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_031719_279160_F0C36BB0 
X-CRM114-Status: UNSURE (   5.95  )
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

SGksCgoKT24gMjAyMy84LzE4IDA2OjA4LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+PiBQbGVhc2Ug
bm90ZSB0aGF0IGJlZm9yZSBhcHBseSB0aGlzIHBhdGNoLCB2Z2FhcmIgY2FuIG5vdCBzZWxlY3Qg
dGhlCj4+IHJpZ2h0IGJvb3QgdmdhIGR1ZSB0byB3ZWlyZCBsb2dpYyBpbnRyb2R1Y2VkIHdpdGgg
dGhlIGNvbW1pdAo+PiA1N2ZjNzMyM2E4ZTdjICgiTG9vbmdBcmNoOiBBZGQgUENJIGNvbnRyb2xs
ZXIgc3VwcG9ydCIpCj4gSWYgd2UgbmVlZCB0aGlzIHJlZmVyZW5jZSB0byA1N2ZjNzMyM2E4ZTdj
LCB3ZSBuZWVkIG1vcmUgc3BlY2lmaWNzCj4gYWJvdXQgd2hhdCB0aGUgIndlaXJkIGxvZ2ljIiBp
cy4gIHBjaV9maXh1cF92Z2FkZXYoKSBpcyB0aGUgb25seQo+IG9idmlvdXMgVkdBIGNvbm5lY3Rp
b24sIHNvIEkgc3VwcG9zZSBpdCdzIHJlbGF0ZWQgdG8gdGhhdC4KPgoKU29ycnksIHJlLXJlYWRp
bmcgeW91ciByZXZpZXdzLApJIHJlYWxpemVkIHRoYXQgSSBtYXkgbWlzcyB0aGUgcG9pbnQswqAg
aGVyZSwgdGhlIHNlbnRlbmNlIGlzIG5vdCB3ZWxsIHBoYXNlZCwKQ29ycmVjdCBleHByZXNzaW9u
IHNob3VsZCBiZToKCgpQbGVhc2Ugbm90ZSB0aGF0IGJlZm9yZSBhcHBseSB0aGlzIHBhdGNoLCB0
aGVyZSBkb24ndCBoYXZlIGEgcmVhc29uYWJsZSwgc3lzdGVtIGxldmVsIHNvbHV0aW9uIG9uIGxv
b25nYXJjaC4KVkdBQVJCIHNlbGVjdCBhIHdyb25nIGRldmljZSBhcyBwcmltYXJ5IEdQVSBkdWUg
dG8gdGhlIHBjaV9maXh1cF92Z2FkZXYoKSBmdW5jdGlvbgppbnRyb2R1Y2VkIHdpdGggdGhlIGNv
bW1pdCA1N2ZjNzMyM2E4ZTdjICgiTG9vbmdBcmNoOiBBZGQgUENJIGNvbnRyb2xsZXIgc3VwcG9y
dCIpLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
