Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2895FCA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsX7HZHRpGmF8NXXQgVihbg2ccfIt4k5f4v/TUmR3LQ=; b=CbndibReT1UlDq
	tFTqFBaUJXTLUqPM7YraM8+Nke2B8JiuquvsU6QBw+j0crt6KfQmR8281+FM7y3g9z9dS5sPQ4mpE
	+IPRN0ZUkoL5IoZJvwkWPNsPtowhr7gyxvXCDH+OVsIKIvmK7IZ4qcozklZOivUeH4V1xWNtlECBj
	Y/38B8m1icX1SBBxp6m5pBvThJ2UHwcjfsxlIo9zK463IolYg+XiXGIXup/3WhoSvq9BK55PV1dXu
	Efd3PKPilU94lfq2ijZGzTshGJQhG+bU7gwA26u07qQFe7XXB/NCOtJi94eNFk8ZTz9Y6enn1r1K5
	J0/cMjFpMWnT0/QLySAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg16P-00343V-36;
	Tue, 12 Sep 2023 10:58:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg16M-003416-2V
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 10:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 330DB6090C
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C0BC433CA
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694516317;
	bh=bMazgWjiUns7bxIOW7iDcJXKsG8+oY7C1L0a2QPDtNQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N5amLBUeuaQQfQrkRGbMQPohZMxyrm/E+1U8aGzLmQkBBe1SjxaKm3mBIDG1j3MB7
	 mEelEBPOX/CgAHNU5OpXYjmkc9An28zQLE48MZaqrAk2d1j2J6LiO4u10zUyVtPwxI
	 0dD7Os9rGlNUQy5YIVpQnMAFAXwIEfKHXjBzrypBIE/g+a4kKPKv2jy3wWCHQcfED4
	 +soa92eXj4Bwepl+2a0I2nUKXZIa/VuBhP0LjZ1cT4PMwY+lVBfLdL/YoYKX+I07iT
	 TzenYk+RO9bhdZaKU2TuaZjIPxWPmKt/+hiSYduBOx7DeXFqVWzBVWLz79ChMaiSsn
	 YgpE96OaS9lrg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9936b3d0286so720117666b.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 03:58:37 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz6YxNL+2asyEZ1xXWwP6hGXikX7uAnML9o8MhG/swdCfVTQ5TB
	WidfbpghQrms33DJ3X/CjDaHX+8cuNAuvWsFjwM=
X-Google-Smtp-Source: AGHT+IFlJTroWUzDrpNmu1jFhrEOedb4AZCufJm4Yw5gh0F+6q7MG2VcUbiSngUFjwNHEEx8rscVSAFajHlgNpUUEAg=
X-Received: by 2002:a17:906:2d1:b0:9ad:7d5b:ba68 with SMTP id
 17-20020a17090602d100b009ad7d5bba68mr1879773ejk.32.1694516316048; Tue, 12 Sep
 2023 03:58:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910-esteemed-exodus-706aaae940b1@spud>
 <CAJF2gTRQd_dNuZHNwfg3SwD0XERaYXYUdFUFQiarym40kpxFRQ@mail.gmail.com>
 <20230910-baggage-accent-ec5331b58c8e@spud> <CAJF2gTS8Vh5XdMUcgLA_GJzW6Nm3JKHxuMN9jYSNe_YCEjgCXA@mail.gmail.com>
 <20230910-facsimile-answering-60d1452b8c10@spud> <CAJF2gTSP1rxVhuwOKyWiE2vFFijJFc2aKRU2=0rTK9nDc8AbsQ@mail.gmail.com>
 <20230911-nimbly-outcome-496efae7adc6@wendy> <CAJF2gTTSDtnc7WRAZ0eLjiwZHZFbOcPZaQ_c8LiLcctBNsKCaA@mail.gmail.com>
 <20230912-snitch-astronaut-41e1b694d24f@wendy>
In-Reply-To: <20230912-snitch-astronaut-41e1b694d24f@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 18:58:22 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXhjvP3WRDKOJ67Bv+KSB-Dh2LAuSsf0kv12HJCmSL7Q@mail.gmail.com>
Message-ID: <CAJF2gTQXhjvP3WRDKOJ67Bv+KSB-Dh2LAuSsf0kv12HJCmSL7Q@mail.gmail.com>
Subject: Re: [PATCH V11 00/17] riscv: Add Native/Paravirt qspinlock support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, paul.walmsley@sifive.com, anup@brainfault.org, 
	peterz@infradead.org, mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, 
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de, 
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, 
	alexghiti@rivosinc.com, keescook@chromium.org, greentime.hu@sifive.com, 
	ajones@ventanamicro.com, jszhang@kernel.org, wefu@redhat.com, 
	wuwei2016@iscas.ac.cn, leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_035838_896085_34C826F9 
X-CRM114-Status: GOOD (  20.38  )
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

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgNDowOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMDk6
MzM6NTdBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDExLCAyMDIzIGF0
IDg6NTPigK9QTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90
ZToKPgo+ID4gPiBJIGFkZGVkIHRoZSBuZXcgInJpc2N2LGlzYS1leHRlbnNpb25zIiBwcm9wZXJ0
eSBpbiBwYXJ0IHRvIG1ha2UKPiA+ID4gY29tbXVuaWNhdGluZyB2ZW5kb3IgZXh0ZW5zaW9ucyBs
aWtlIHRoaXMgZWFzaWVyLiBQbGVhc2UgdHJ5IHRvIHVzZQo+ID4gPiB0aGF0LiAicXNwaW5sb2Nr
IiBpcyBzb2Z0d2FyZSBjb25maWd1cmF0aW9uIHRob3VnaCwgdGhlIHZlbmRvciBleHRlbnNpb24K
PiA+ID4gc2hvdWxkIGZvY3VzIG9uIHRoZSBndWFyYW50ZWUgb2Ygc3Ryb25nIGZvcndhcmQgcHJv
Z3Jlc3MsIHNpbmNlIHRoYXQgaXMKPiA+ID4gdGhlIG5vbi1zdGFuZGFyZCBhc3BlY3Qgb2YgeW91
ciBJUC4KPiA+Cj4gPiBUaGUgcXNwaW5sb2NrIGNvbnRhaW5zIHRocmVlIHBhdGhzOgo+ID4gIC0g
TmF0aXZlIHFzcGlubG9jaywgdGhpcyBpcyB5b3VyIHN0cm9uZyBmb3J3YXJkIHByb2dyZXNzLgo+
ID4gIC0gdmlydF9zcGluX2xvY2ssIGZvciBLVk0gZ3Vlc3Qgd2hlbiBwYXJhdmlydCBxc3Bpbmxv
Y2sgZGlzYWJsZWQuCj4gPiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8y
MDIzMDkxMDA4MjkxMS4zMzc4NzgyLTktZ3VvcmVuQGtlcm5lbC5vcmcvCj4gPiAgLSBwYXJhdmly
dCBxc3BpbmxvY2ssIGZvciBLVk0gZ3Vlc3QKPiA+Cj4gPiBTbywgd2UgbmVlZCBhIHNvZnR3YXJl
IGNvbmZpZ3VyYXRpb24gaGVyZSwgInJpc2N2LGlzYS1leHRlbnNpb25zIiBpcwo+ID4gYWxsIGFi
b3V0IHZlbmRvciBleHRlbnNpb24uCj4KPiBBaCByaWdodCwgeWVzIGl0IHdvdWxkIG9ubHkgYmUg
YWJsZSB0byBiZSB1c2VkIHRvIGRldGVybWluZSB3aGV0aGVyIG9yCj4gbm90IHRoZSBwbGF0Zm9y
bSBpcyBjYXBhYmxlIG9mIHN1cHBvcnRpbmcgdGhlc2Ugc3BpbmxvY2tzLCBub3Qgd2hldGhlciBv
cgo+IG5vdCB0aGUga2VybmVsIGlzIGEgZ3Vlc3QuIEkgdGhpbmsgSSBtaXNpbnRlcnByZXRlZCB0
aGF0IHNuaXBwZXQgeW91IHBvc3RlZCwKPiB0aGlua2luZyB5b3Ugd2VyZSB0cnlpbmcgdG8gZGlz
YWJsZSB5b3VyIG5ldyBzcGlubG9jayBmb3IgS1ZNLCBzb3JyeS4KPiBPbiB0aGF0IG5vdGUgdGhv
dWdoLCB3aGF0IGFib3V0IG90aGVyIHNvcnRzIG9mIGd1ZXN0cz8gV2lsbCBub24tS1ZNCj4gZ3Vl
c3RzIG5vdCBhbHNvIHdhbnQgdG8gdXNlIHRoaXMgdmlydCBzcGlubG9jaz8KSSBvbmx5IHB1dCBL
Vk0gZ3Vlc3RzIGhlcmUsIGFuZCBJIGNhbid0IGFuc3dlciBvdGhlciBoeXBlcnZpc29yIHRoYXQK
aXMgYW5vdGhlciB0b3BpYy4KCj4KPiBUaGFua3MsCj4gQ29ub3IuCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
