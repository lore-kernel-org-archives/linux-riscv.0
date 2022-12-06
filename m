Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D517C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 04:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdN6QHoK8Kj079eLnu0wHuSExyCJHY5hE3IqaKdFI+4=; b=tFjE5EfSRKLNWX
	9DiYOrZJhSgvgaZjd1LkE/qrzee9MIUoSYWh6YUOeG20pHX0wFwOGTfofL54Y5w75ScciR+tLMVYj
	IGcLoIpaFI9GLtqhGL/NVvfpPyhVFfW+t+Od0cFbuYnr2BVwVQjEb3LBSa4Vw2Cp+a/4vaWVPm83/
	1ushxLW+6l4qDcCjqlhwONOyeBH7HwHGkrpyI8aB8SSwOturcvndHJhNE8EkFbzRMz4wa1l7ntqsO
	TphXNWxn/am2IFnCz3mi0BGx2mewfG+WgIpT2MgftA60k7gBGuOwoU+zYlsv/dEtzyzovbhWKnKxW
	TN864FOYbklCU2vtYOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Pjx-000BHY-22; Tue, 06 Dec 2022 04:39:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Pju-000B3L-Fl
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 04:39:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56B7DB8169E
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 04:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E34C43142
	for <linux-riscv@lists.infradead.org>; Tue,  6 Dec 2022 04:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670301560;
	bh=Zi2TCrzV+lX+8o+6WmgyVR7dIbJ2bTSv5zbEP5K7Wdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iDOGgKfh/Zzn6a+o1rB7sY2CO5hofYYcTk0ON4hrdw+ul8WIwKVFKmL3YELda0IOv
	 GcIPQkCZVP1mgKOd4iHVJEeYxQ3VglNFpalDlnYCKez4+coQjGvYtH2WiweYxM8xWv
	 UrGameoEwlLnmhdlg0P7zoxcYXdjgrWCrizqyZ7OCHk7Pb2F+A1yjyQjxSOBE4nLlS
	 WtXj+E0TZUvunpL7Zb6XmaUUUGlhs6v9VMO4d/HGKMk39gkU9CO9Mt+5G3T8aRIFXP
	 hFGq4Vzv1N1R8iy9xUChVT4+U8ilKe39cYPfIWgEzed0WBKv1HzY5wSWPV2dl1DEhL
	 zLOsmFwfGszsQ==
Received: by mail-ej1-f52.google.com with SMTP id gu23so3324856ejb.10
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 20:39:20 -0800 (PST)
X-Gm-Message-State: ANoB5pkYDMIfy4BtF893tusKJD8ufD/2FaKVotKjNR50Vcny9PN+TvuS
	YnrmzkKarPOZB5rIb8xSqY0OAs0XUmInLiLGbzE=
X-Google-Smtp-Source: AA0mqf4Cb25u2Un1Ox5XVVHNByWvhjp8cPyEPeNr0q4kwrVeEqYk1+Z15oDhYHUyijoAX5GuFOohSrGZy+x7dj+AIw0=
X-Received: by 2002:a17:906:b213:b0:7c0:f7af:7c5e with SMTP id
 p19-20020a170906b21300b007c0f7af7c5emr5607481ejz.406.1670301558699; Mon, 05
 Dec 2022 20:39:18 -0800 (PST)
MIME-Version: 1.0
References: <20221103075047.1634923-1-guoren@kernel.org> <20221103075047.1634923-3-guoren@kernel.org>
 <87iliq9psg.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87iliq9psg.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 6 Dec 2022 12:39:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2mZePK4cmFqi-E8=R7g9kmnPqnYg-kNewqaEUDXMXUQ@mail.gmail.com>
Message-ID: <CAJF2gTT2mZePK4cmFqi-E8=R7g9kmnPqnYg-kNewqaEUDXMXUQ@mail.gmail.com>
Subject: Re: [PATCH -next V8 02/14] riscv: elf_kexec: Fixup compile warning
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de, 
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com, 
	zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com, 
	chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_203930_832274_C8B4A154 
X-CRM114-Status: GOOD (  18.45  )
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

T24gTW9uLCBEZWMgNSwgMjAyMiBhdCA1OjEzIFBNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gZ3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgo+Cj4gPiBGcm9tOiBH
dW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gSWYgQ1JZVFBPIG9yIENS
WVBUT19TSEEyNTYgb3IgS0VYRV9GSUxFIGlzIG5vdCBlbmFibGVkLCB0aGVuOgo+ID4KPiA+IENP
TVBJTEVSX0lOU1RBTExfUEFUSD0kSE9NRS8wZGF5IENPTVBJTEVSPWdjYy0xMi4xLjAgbWFrZS5j
cm9zcyBXPTEKPiA+IE89YnVpbGRfZGlyIEFSQ0g9cmlzY3YgU0hFTEw9L2Jpbi9iYXNoIGFyY2gv
cmlzY3YvCj4gPgo+ID4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmM6IEluIGZ1bmN0
aW9uICdlbGZfa2V4ZWNfbG9hZCc6Cj4gPiAuLi9hcmNoL3Jpc2N2L2tlcm5lbC9lbGZfa2V4ZWMu
YzoxODU6MjM6IHdhcm5pbmc6IHZhcmlhYmxlCj4gPiAna2VybmVsX3N0YXJ0JyBzZXQgYnV0IG5v
dCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ID4gICAxODUgfCAgICAgICAgIHVu
c2lnbmVkIGxvbmcga2VybmVsX3N0YXJ0Owo+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+Cj4gPgo+ID4gRml4ZXM6IDgzOGIzZTI4NDg4ZiAoIlJJU0MtVjogTG9h
ZCBwdXJnYXRvcnkgaW4ga2V4ZWNfZmlsZSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+ID4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BA
aW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmMgfCAy
ICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvZWxmX2tleGVjLmMKPiA+IGluZGV4IDBjYjk0OTkyYzE1Yi4uNGI5MjY0MzQw
Yjc4IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvZWxmX2tleGVjLmMKPiA+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL2VsZl9rZXhlYy5jCj4gPiBAQCAtMTk4LDcgKzE5OCw3IEBA
IHN0YXRpYyB2b2lkICplbGZfa2V4ZWNfbG9hZChzdHJ1Y3Qga2ltYWdlICppbWFnZSwgY2hhciAq
a2VybmVsX2J1ZiwKPiA+ICAgICAgIGlmIChyZXQpCj4gPiAgICAgICAgICAgICAgIGdvdG8gb3V0
Owo+ID4gICAgICAga2VybmVsX3N0YXJ0ID0gaW1hZ2UtPnN0YXJ0Owo+ID4gLSAgICAgcHJfbm90
aWNlKCJUaGUgZW50cnkgcG9pbnQgb2Yga2VybmVsIGF0IDB4JWx4XG4iLCBpbWFnZS0+c3RhcnQp
Owo+ID4gKyAgICAgcHJfbm90aWNlKCJUaGUgZW50cnkgcG9pbnQgb2Yga2VybmVsIGF0IDB4JWx4
XG4iLCBrZXJuZWxfc3RhcnQpOwo+Cj4gVGhpcyBwYXRjaCBzaG91bGRuJ3QgYmUgcGFydCBvZiB0
aGUgZ2VuZXJpYyBlbnRyeSBzZXJpZXMuIEl0J3MganVzdCBhCj4gZ2VuZXJpYyBmaXghIFBsZWFz
ZSBoYXZlIHRoaXMgYXMgYSBzZXBhcmF0ZSBwYXRjaC4KT2theQoKPgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
