Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9175CD343C
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 05:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqFK8nN7h5Cy31jkH4PSltqUYD0cRsBTKy2Zq/sfPao=; b=2NBEzeaSB80nO/
	/Zo74ZI8xZPZ0y3HyAWt/ruF83pHJ4IfQHBCbot3f9UehhRirgKofj9OK/JIiVhV4P63zR5PNXqFL
	e3/5BPzDsjvoP+OHG38nYdJubBLy52HM8M8nj9C1cIiiM2ADmwaHO73boSE3P2mvhrVs4M9sj6JYS
	IcBfRbpqY5S0hY3uLn2HJbWf7yp1X+nmdyiekDYXsLW6NIvObNvUsWpBFACaBXsmBqG2DPSGsk2mX
	6gLBtPtqOjflETbrgUu283OFqPb1sFT+de4dM+7DRaTgSwzxjQ1Ftc52JkTMLXbPTo0gMLCHXQPhM
	IoBfzI9e7D2s9x0qK//A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTYX-00H4Kb-1I;
	Tue, 19 Sep 2023 05:45:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTYU-00H4JJ-35
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 05:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695102350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiVEPo5eeRXHXivfzlf4pcDpdl4skr74vqWMfN6Le04=;
	b=QjFMctCMTih3hJhzVi1Te3He754jLHbNGUQMTw5DQjGRyJhZeib5pJeJiZoKtqUwQZ2Wv8
	mqQYHT/AENZxjqfCcHL3lZ/KGDGRmCI+n83Q5O1L8bA5hitNKnq6jr0v4Th8GW0OcEEbha
	9efbmp+0rRrTHvtbI3Bv1vI97kIOPsg=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-0SBMa3kXM7Sma3j2O7E6iw-1; Tue, 19 Sep 2023 01:45:48 -0400
X-MC-Unique: 0SBMa3kXM7Sma3j2O7E6iw-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-1d5f4d5d848so8478485fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 22:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695102348; x=1695707148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HiVEPo5eeRXHXivfzlf4pcDpdl4skr74vqWMfN6Le04=;
        b=jSeCSkBOl2Xj+cmS720IXpg7tH1nv7eUNKigMdCtEnZeAM0wQM6OrQ9a/ONVXTsc95
         NWWV7XqS3D6nA86sbqGBgfzu57ASS78Wrgrykypcte7sVhhWYjNf7ZYHrK1NOo4Vjaha
         Nm9YQwOc7cRGKrw0gpmo6urg3Tvvw0gxZUy2DCenW9YmGdqlIpZp7IDFhy897v5aPsUi
         swadwS8zXPP/p3UcpCkAbpgNgdfUG8owrFolTqYnLAR/dacn6ntluaX0QIE3BqUjmsfK
         y7zIVvlEqLdQBEFsMcrD5RvyInRLbGB2nYho2lAel36TpRVYv8aDZUgphD0OEOop8VaB
         wSMg==
X-Gm-Message-State: AOJu0Yw3LQJmLFH0Xc4Batjl2irgRh3KBzZ836nDy+HQmEXRRrKh4bSf
	qxDeFW2jAtrtUIyhOEuVG+4AElqb0zYTeAqMGK6oh6vVFtoSqj9e3FW+iZ2zzO4aESvC2r2FBoQ
	QvTXIziZK7efmVbeTj2CRhVgtV0JM
X-Received: by 2002:a05:6870:5690:b0:1bb:83e9:6277 with SMTP id p16-20020a056870569000b001bb83e96277mr13486620oao.33.1695102348001;
        Mon, 18 Sep 2023 22:45:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHA7fVjpU09v/Q+0JN+fs3b+WtouB3O3IFXrPr3jgLPWef/tjcxoKLI0bNZO/4778Pfmzj0VA==
X-Received: by 2002:a05:6870:5690:b0:1bb:83e9:6277 with SMTP id p16-20020a056870569000b001bb83e96277mr13486603oao.33.1695102347774;
        Mon, 18 Sep 2023 22:45:47 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:677d:42e9:f426:9422:f020])
        by smtp.gmail.com with ESMTPSA id cc6-20020a056871e18600b001b3d67934e9sm5733332oac.26.2023.09.18.22.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 22:45:47 -0700 (PDT)
Date: Tue, 19 Sep 2023 02:45:37 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 13/17] RISC-V: paravirt: pvqspinlock: Add SBI
 implementation
Message-ID: <ZQk1gTtXayK9BDfB@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-14-guoren@kernel.org>
 <ZQP4SXLf00IntVWd@redhat.com>
 <CAJF2gTTBwFKjVOovMHB171s+nymL88OANpS3O-uwKBLxto43mA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTTBwFKjVOovMHB171s+nymL88OANpS3O-uwKBLxto43mA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_224551_065209_AD181919 
X-CRM114-Status: GOOD (  28.44  )
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

T24gU3VuLCBTZXAgMTcsIDIwMjMgYXQgMTE6MDY6NDhQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCAyOjIz4oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNDoy
OTowN0FNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBJbXBsZW1lbnQgcHZfa2lj
ayB3aXRoIFNCSSBpbXBsZW1lbnRhdGlvbiwgYW5kIGFkZCBTQklfRVhUX1BWTE9DSwo+ID4gPiBl
eHRlbnNpb24gZGV0ZWN0aW9uLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxn
dW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c2JpLmggICAgICAgICAgIHwgNiArKysrKysKPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3FzcGlu
bG9ja19wYXJhdmlydC5jIHwgNyArKysrKystCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc2JpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4g
PiA+IGluZGV4IGUwMjMzYjNkN2E1Zi4uMzUzM2Y4ZDRmM2UyIDEwMDY0NAo+ID4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vc2JpLmgKPiA+ID4gQEAgLTMwLDYgKzMwLDcgQEAgZW51bSBzYmlfZXh0X2lkIHsKPiA+
ID4gICAgICAgU0JJX0VYVF9IU00gPSAweDQ4NTM0RCwKPiA+ID4gICAgICAgU0JJX0VYVF9TUlNU
ID0gMHg1MzUyNTM1NCwKPiA+ID4gICAgICAgU0JJX0VYVF9QTVUgPSAweDUwNEQ1NSwKPiA+ID4g
KyAgICAgU0JJX0VYVF9QVkxPQ0sgPSAweEFCMDQwMSwKPiA+ID4KPiA+ID4gICAgICAgLyogRXhw
ZXJpbWVudGFscyBleHRlbnNpb25zIG11c3QgbGllIHdpdGhpbiB0aGlzIHJhbmdlICovCj4gPiA+
ICAgICAgIFNCSV9FWFRfRVhQRVJJTUVOVEFMX1NUQVJUID0gMHgwODAwMDAwMCwKPiA+ID4gQEAg
LTI0Myw2ICsyNDQsMTEgQEAgZW51bSBzYmlfcG11X2N0cl90eXBlIHsKPiA+ID4gIC8qIEZsYWdz
IGRlZmluZWQgZm9yIGNvdW50ZXIgc3RvcCBmdW5jdGlvbiAqLwo+ID4gPiAgI2RlZmluZSBTQklf
UE1VX1NUT1BfRkxBR19SRVNFVCAoMSA8PCAwKQo+ID4gPgo+ID4gPiArLyogU0JJIFBWTE9DSyAo
a2ljayBjcHUgb3V0IG9mIHdmaSkgKi8KPiA+ID4gK2VudW0gc2JpX2V4dF9wdmxvY2tfZmlkIHsK
PiA+ID4gKyAgICAgU0JJX0VYVF9QVkxPQ0tfS0lDS19DUFUgPSAwLAo+ID4gPiArfTsKPiA+ID4g
Kwo+ID4gPiAgI2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX0RFRkFVTFQgICAgIDB4MQo+ID4gPiAg
I2RlZmluZSBTQklfU1BFQ19WRVJTSU9OX01BSk9SX1NISUZUIDI0Cj4gPiA+ICAjZGVmaW5lIFNC
SV9TUEVDX1ZFUlNJT05fTUFKT1JfTUFTSyAgMHg3Zgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9xc3Bp
bmxvY2tfcGFyYXZpcnQuYwo+ID4gPiBpbmRleCBhMGFkNDY1N2Y0MzcuLjU3MTYyNmYzNTBiZSAx
MDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMK
PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiA+ID4g
QEAgLTExLDYgKzExLDggQEAKPiA+ID4KPiA+ID4gIHZvaWQgcHZfa2ljayhpbnQgY3B1KQo+ID4g
PiAgewo+ID4gPiArICAgICBzYmlfZWNhbGwoU0JJX0VYVF9QVkxPQ0ssIFNCSV9FWFRfUFZMT0NL
X0tJQ0tfQ1BVLAo+ID4gPiArICAgICAgICAgICAgICAgY3B1aWRfdG9faGFydGlkX21hcChjcHUp
LCAwLCAwLCAwLCAwLCAwKTsKPiA+ID4gICAgICAgcmV0dXJuOwo+ID4gPiAgfQo+ID4gPgo+ID4g
PiBAQCAtMjUsNyArMjcsNyBAQCB2b2lkIHB2X3dhaXQodTggKnB0ciwgdTggdmFsKQo+ID4gPiAg
ICAgICBpZiAoUkVBRF9PTkNFKCpwdHIpICE9IHZhbCkKPiA+ID4gICAgICAgICAgICAgICBnb3Rv
IG91dDsKPiA+ID4KPiA+ID4gLSAgICAgLyogd2FpdF9mb3JfaW50ZXJydXB0KCk7ICovCj4gPiA+
ICsgICAgIHdhaXRfZm9yX2ludGVycnVwdCgpOwo+ID4gPiAgb3V0Ogo+ID4gPiAgICAgICBsb2Nh
bF9pcnFfcmVzdG9yZShmbGFncyk7Cj4gPiA+ICB9Cj4gPiA+IEBAIC02Miw2ICs2NCw5IEBAIHZv
aWQgX19pbml0IHB2X3FzcGlubG9ja19pbml0KHZvaWQpCj4gPiA+ICAgICAgIGlmKHNiaV9nZXRf
ZmlybXdhcmVfaWQoKSAhPSBTQklfRVhUX0JBU0VfSU1QTF9JRF9LVk0pCj4gPiA+ICAgICAgICAg
ICAgICAgcmV0dXJuOwo+ID4gPgo+ID4gPiArICAgICBpZiAoIXNiaV9wcm9iZV9leHRlbnNpb24o
U0JJX0VYVF9QVkxPQ0spKQo+ID4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ID4gKwo+ID4g
PiAgICAgICBwcl9pbmZvKCJQViBxc3BpbmxvY2tzIGVuYWJsZWRcbiIpOwo+ID4gPiAgICAgICBf
X3B2X2luaXRfbG9ja19oYXNoKCk7Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuMzYuMQo+ID4gPgo+
ID4KPiA+IElJVUMgdGhpcyBQVkxPQ0sgZXh0ZW5zaW9uIGlzIG5vdyBhIHJlcXVpcmVtZW50IHRv
IHVzZSBwdl9xc3BpbmxvY2soKSwgYW5kCj4gPiBpdCBhbGxvd3MgYSBjcHUgdG8gdXNlIGFuIGlu
c3RydWN0aW9uIHRvIHdhaXQgZm9yIGludGVycnVwdCBpbiBwdl93YWl0KCksCj4gPiBhbmQga2lj
a3MgaXQgb3V0IG9mIHRoaXMgd2FpdCB1c2luZyBhIG5ldyBzYmlfZWNhbGwoKSBvbiBwdl9raWNr
KCkuCj4gWWVzLgo+IAo+ID4KPiA+IE92ZXJhbGwgaXQgTEdUTSwgYnV0IHdvdWxkIGJlIG5pY2Ug
dG8gaGF2ZSB0aGUgcmVmZXJlbmNlIGRvYyBpbiB0aGUgY29tbWl0Cj4gPiBtc2cuIEkgZW5kIHVw
IGluZmVycmluZyBzb21lIG9mIHRoZSBpbm5lciB3b3JraW5ncyBieSB5b3VyIGltcGxlbWVudGF0
aW9uLAo+ID4gd2hpY2ggaXMgbm90IGlkZWFsIGZvciByZXZpZXdpbmcuCj4gSSB3b3VsZCBpbXBy
b3ZlIHRoZSBjb21taXQgbXNnIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgcGF0Y2guCgpUaHghCkxl
bwoKPiAKPiA+Cj4gPiBJZiB1bmRlcnN0YW5kaW5nIGFib3ZlIGlzIHJpZ2h0LAo+ID4gUmV2aWV3
ZWQtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiA+Cj4gPiBUaGFua3Mh
Cj4gPiBMZW8KPiA+Cj4gCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
