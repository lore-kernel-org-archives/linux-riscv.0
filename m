Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD17FCAC5B2
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Sep 2024 03:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1md56opGXL6vIUkSyIjOOwgOSz8vXZTOnDNmP6fEfc=; b=MIYLjCGv0l6YhL
	T6F7OOfzVSEfc3FhZgi4PjjwgfKm/5/X7R8jv4cZkqnN4IKGzQxV43h3DP7L+jgT3HC0+h+0kThvM
	SYXmiAwcVuufIFLHGTHeaEfPq2wmYqFXDbU7Q6Fh2l7xUxyyPyrW01Go/FjUaFtETkPqYu3bA1fdq
	IES+pwRgnEQHSYBjCq2lz5ean5mDgH1mapzin1wg0nnxDl5dGeewHGA0/EMUDsG9nQhgYHVNKnYoD
	dc6MOA91BigrGiRr15bny1vaxV+u3I9FLRVuK5wguMfkAhKVLT6wHzm8SGVroXO1CMF1/LG5mTN0O
	FpLQx4ZNHadPjLgXvtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlLe-00000007NQS-2Swf;
	Wed, 18 Sep 2024 03:27:22 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqlLb-00000007NPt-1Axa
	for linux-riscv@lists.infradead.org;
	Wed, 18 Sep 2024 03:27:21 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-710e1a47b40so1266418a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 20:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1726630037; x=1727234837; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYbvktLigUAMTePHROfk7Jv5OlFqQlOacIqWxghUJRY=;
        b=CadCnmnT/Ck0e8W8p+X+yTAMUOzZCXut0HXo4RWr68q/IlHV3HXeQi+YAhY01FmCid
         LnUWn20z0ouKXk6q1yh94nTPTOngKn4MlnnnhgTgTdtRsVoo/YUhI8cosCQ+Wl7Lx4At
         Lc/7AylvdxAnVajFJWrVcoKtfIefSIO2+UVyCzZDWbvQFMCJRrWKuxpvGXqw86YG+5B7
         rr8Pol3kK0G4OVyBeCDb7xlUfN7W+DJu9WS/4WjaU9SMlJ9SyyxdiuGCZyH7wiUlzq/D
         O3laGzsBswFfrZl0/ujeac74dOWNx+rdpTYCar7qbUvYJB+5iRll+cw7ACXpcHwvWSL4
         aAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726630037; x=1727234837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TYbvktLigUAMTePHROfk7Jv5OlFqQlOacIqWxghUJRY=;
        b=CwYX8of+is19iZqLjPFdm9psyHTsNN6pE4sWfLjON0PBDfiMcTC57CO5W9n937T9ks
         ybNnxy7md2V7lhV3Cn47JvAokInQ/bScS3win1cWhCkqeD4c83mowVetfTrxZQsCZhLj
         C90Cum19DGVkgRwOl0wfkVUDLsYFzA5xJarFO/Pg1dje+Bpg2qMKqm3HQOhIR67va1ow
         k1Ez14X55ZM/5yfbKpwJ3xi19BrkN2YGxkp1uzdFq5yQgsNbHcwjXNuuQ7/VuqNXQ7hv
         QxdVqYN8yqbjKLUCIMpWPiNXE+u1yZTSznDOq5dPsyualVuRmctwxX2JPRtSCXCKxITW
         xmww==
X-Forwarded-Encrypted: i=1; AJvYcCVkTy3gM8RF3avfJZnvGD2ry09ukWvTyluyGw/wBrVTktgyk3LHLfJ9KCssqZd7m5DY7F4Y+WXhxwCSxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIbXBO64e2I9ptzsde5kPWj3E96CZQm9BeFSLgu5RVOv0MhFU7
	PwwBVmiSuGh3tRbv7O3leBHzqVrIDkVdKkal9D+oXJNj2Y2YZnFDk9TETuErTnn4SZvTqpIiohr
	BjVs4AIfpJ0hiZHV+MWFbl8sKWoG+Lh/o23qOpA==
X-Google-Smtp-Source: AGHT+IGnWsj7m6M03RuqK5J3Evla2on7+gi75SF/oTkeVo0Do/aPuvXYeH6pKmpjg/5K6bHn/XUas+a8J1zUo6DQYR8=
X-Received: by 2002:a05:6830:6586:b0:710:db4f:8ee2 with SMTP id
 46e09a7af769-71116bf700dmr10718380a34.16.1726630037010; Tue, 17 Sep 2024
 20:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <874j8hku51.fsf@gmail.com> <mhng-7b39a06f-bf26-4bc0-beef-45bd4b5312e1@palmer-ri-x1c9>
In-Reply-To: <mhng-7b39a06f-bf26-4bc0-beef-45bd4b5312e1@palmer-ri-x1c9>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 18 Sep 2024 11:27:05 +0800
Message-ID: <CAEEQ3wkMY-gfvVo9LqrQUGXibKaBf9vmBjtN+AsRVG5-e1fv0A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] RISC-V: cmdline: Add support for
 'memmap' parameter
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: punit.agrawal@bytedance.com, rppt@kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, 
	akpm@linux-foundation.org, bhe@redhat.com, dawei.li@shingroup.cn, 
	jszhang@kernel.org, namcao@linutronix.de, chenjiahao16@huawei.com, 
	Bjorn Topel <bjorn@rivosinc.com>, vishal.moola@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_202719_553786_FEAE8768 
X-CRM114-Status: GOOD (  26.84  )
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

SGkgUGFsbWVyLAoKT24gU2F0LCBTZXAgMTQsIDIwMjQgYXQgNDoyMeKAr1BNIFBhbG1lciBEYWJi
ZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCAyMiBKdWwgMjAyNCAx
NDoxMzoxNCBQRFQgKC0wNzAwKSwgcHVuaXQuYWdyYXdhbEBieXRlZGFuY2UuY29tIHdyb3RlOgo+
ID4gSGkgUGFsbWVyLAo+ID4KPiA+IENoYXJsaWUgSmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5j
b20+IHdyaXRlczoKPiA+Cj4gPj4gT24gTW9uLCBKdW4gMjQsIDIwMjQgYXQgMDg6Mzc6MzlQTSAr
MDgwMCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+Pj4gQWRkIHBhcnNpbmcgb2YgJ21lbW1hcCcgdG8g
dXNlIG9yIHJlc2VydmUgYSBzcGVjaWZpYyByZWdpb24gb2YgbWVtb3J5Lgo+ID4+Pgo+ID4+PiBJ
bXBsZW1lbnQgdGhlIGZvbGxvd2luZyBtZW1tYXAgdmFyaWFudHM6Cj4gPj4+IC0gbWVtbWFwPW5u
W0tNR11Ac3NbS01HXTogZm9yY2UgdXNhZ2Ugb2YgYSBzcGVjaWZpYyByZWdpb24gb2YgbWVtb3J5
Owo+ID4+PiAtIG1lbW1hcD1ubltLTUddJHNzW0tNR106IG1hcmsgc3BlY2lmaWVkIG1lbW9yeSBh
cyByZXNlcnZlZDsKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVu
aHVpQGJ5dGVkYW5jZS5jb20+Cj4gPj4+IC0tLQo+ID4+PiAgYXJjaC9yaXNjdi9tbS9pbml0LmMg
fCA0NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4+PiAg
MSBmaWxlIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKykKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+Pj4gaW5kZXgg
ZTM0MDVlNGI5OWFmLi44ZTFkOTNhZTVjYjIgMTAwNjQ0Cj4gPj4+IC0tLSBhL2FyY2gvcmlzY3Yv
bW0vaW5pdC5jCj4gPj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPj4+IEBAIC0yMDgs
NiArMjA4LDUyIEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X21lbShjaGFyICpwKQo+ID4+PiAg
fQo+ID4+PiAgZWFybHlfcGFyYW0oIm1lbSIsIGVhcmx5X21lbSk7Cj4gPj4+Cj4gPj4+ICtzdGF0
aWMgdm9pZCBfX2luaXQgcGFyc2VfbWVtbWFwX29uZShjaGFyICpwKQo+ID4+PiArewo+ID4+PiAr
ICAgY2hhciAqb2xkcDsKPiA+Pj4gKyAgIHVuc2lnbmVkIGxvbmcgc3RhcnRfYXQsIG1lbV9zaXpl
Owo+ID4+PiArCj4gPj4+ICsgICBpZiAoIXApCj4gPj4+ICsgICAgICAgICAgIHJldHVybjsKPiA+
Pj4gKwo+ID4+PiArICAgb2xkcCA9IHA7Cj4gPj4+ICsgICBtZW1fc2l6ZSA9IG1lbXBhcnNlKHAs
ICZwKTsKPiA+Pj4gKyAgIGlmIChwID09IG9sZHApCj4gPj4+ICsgICAgICAgICAgIHJldHVybjsK
PiA+Pj4gKwo+ID4+PiArICAgc3dpdGNoICgqcCkgewo+ID4+PiArICAgY2FzZSAnQCc6Cj4gPj4+
ICsgICAgICAgICAgIHN0YXJ0X2F0ID0gbWVtcGFyc2UocCArIDEsICZwKTsKPiA+Pj4gKyAgICAg
ICAgICAgbWVtYmxvY2tfYWRkKHN0YXJ0X2F0LCBtZW1fc2l6ZSk7Cj4gPj4+ICsgICAgICAgICAg
IGJyZWFrOwo+ID4+PiArCj4gPj4+ICsgICBjYXNlICckJzoKPiA+Pj4gKyAgICAgICAgICAgc3Rh
cnRfYXQgPSBtZW1wYXJzZShwICsgMSwgJnApOwo+ID4+PiArICAgICAgICAgICBtZW1ibG9ja19y
ZXNlcnZlKHN0YXJ0X2F0LCBtZW1fc2l6ZSk7Cj4gPj4+ICsgICAgICAgICAgIGJyZWFrOwo+ID4+
PiArCj4gPj4+ICsgICBkZWZhdWx0Ogo+ID4+PiArICAgICAgICAgICBwcl93YXJuKCJVbnJlY29n
bml6ZWQgbWVtbWFwIHN5bnRheDogJXNcbiIsIHApOwo+ID4+PiArICAgICAgICAgICBicmVhazsK
PiA+Pj4gKyAgIH0KPiA+Pj4gK30KPiA+Pj4gKwo+ID4+PiArc3RhdGljIGludCBfX2luaXQgcGFy
c2VfbWVtbWFwX29wdChjaGFyICpzdHIpCj4gPj4+ICt7Cj4gPj4+ICsgICB3aGlsZSAoc3RyKSB7
Cj4gPj4+ICsgICAgICAgICAgIGNoYXIgKmsgPSBzdHJjaHIoc3RyLCAnLCcpOwo+ID4+PiArCj4g
Pj4+ICsgICAgICAgICAgIGlmIChrKQo+ID4+PiArICAgICAgICAgICAgICAgICAgICprKysgPSAw
Owo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgIHBhcnNlX21lbW1hcF9vbmUoc3RyKTsKPiA+Pj4g
KyAgICAgICAgICAgc3RyID0gazsKPiA+Pj4gKyAgIH0KPiA+Pj4gKwo+ID4+PiArICAgcmV0dXJu
IDA7Cj4gPj4+ICt9Cj4gPj4+ICtlYXJseV9wYXJhbSgibWVtbWFwIiwgcGFyc2VfbWVtbWFwX29w
dCk7Cj4gPj4+ICsKPiA+Pj4gIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQp
Cj4gPj4+ICB7Cj4gPj4+ICAgICBwaHlzX2FkZHJfdCB2bWxpbnV4X2VuZCA9IF9fcGFfc3ltYm9s
KCZfZW5kKTsKPiA+Pj4gLS0KPiA+Pj4gMi4yMC4xCj4gPj4+Cj4gPj4KPiA+PiBSZXZpZXdlZC1i
eTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBBbm90aGVy
IHBhdGNoIHRoYXQgbG9va3MgZ29vZCB0byBnZXQgbWVyZ2VkIGlmIHRoZXJlIGFyZSBubyBmdXJ0
aGVyCj4gPiBjb21tZW50cy4KPiA+Cj4gPiBBbnkgY2hhbmNlIHRoaXMgY2FuIGJlIHBpY2tlZCB1
cCBmb3IgdGhpcyBjeWNsZT8KPgo+IFNvcnJ5IGZvciBiZWluZyBzbG93IGhlcmUsIGJ1dCBJIGRv
bid0IHVuZGVyc3RhbmQgdGhlIHVzZSBjYXNlIGZvciB0aGlzOgo+IHdlIGFscmVhZHkgZ2V0IHRo
ZSBtZW1vcnkgbWFwIGZyb20gdGhlIGZpcm13YXJlLCBpdCBzZWVtcyBsaWtlCj4gb3ZlcnJpZGlu
ZyB0aGF0IGlzIGp1c3QgYXNraW5nIGZvciBpc3N1ZXMuCgpXaXRob3V0IG1vZGlmeWluZyB0aGUg
ZmlybXdhcmUsIGl0IGlzIG1vcmUgY29udmVuaWVudCB0byBjb21wbGV0ZSB0aGUKcmVzZXJ2YXRp
b24gb2YgdGhlIG1lbW9yeSBibG9jayBpbiB0aGlzIHdheS4KVGhpcyBwYXJhbWV0ZXIgaXMgYWxz
byBtZW50aW9uZWQgaW4gRG9jdW1lbnRhdGlvbi9hZG1pbiAtIGd1aWRlL2tlcm5lbAotIHBhcmFt
ZXRlcnMudHh0LgoKVGhhbmtzLApZdW5odWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
