Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B874CCD184
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Oct 2025 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+CzU8CXVfpn+0nIN4A1lw1JQrSzaoqjKfRwpDSLocU=; b=RuqaEhunXu8D9Q
	zRhVhyRH76dNTW6pmlYL1HRg1FDErxSvqsgTSzuXvPxWzkf2U3+EtFP0lyFhouxY5c+lwKQiWkvOt
	wp02JHzZdxvELbw6xrDONNo6V7CUm2HyVIqTx6wF0AGwIlEVuecY5QpV2bJnQQT1sx8NLZGMCm06T
	Pr5Cb3BK176+RNK5pZ1eVaB6uIaFOmXfCwcxZ3xnUZHDSmhC2ApBKQrLR4zOxPgbU9L91oCQW9iPw
	oL7SzukjtjthJ42uU4z7XVr9Zv7HSJjm3OpjYOJBv7imb/VqK1XlQtIZSAHgkAALYkp1iW/tHR1oC
	WOx8GsfROBUOa9aDvIVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAbBN-0000000BTIy-0mWd;
	Sun, 19 Oct 2025 21:43:17 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAbBK-0000000BTIL-1gFc
	for linux-riscv@lists.infradead.org;
	Sun, 19 Oct 2025 21:43:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-58afb2f42e3so4255860e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 14:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760910192; x=1761514992; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYhtkFNaT6hVSLlWHWHG49KT7TJItYuebittp1GOm1g=;
        b=BdP/GFwrbS0Gw2qCQeQin3oRQNVZ5HxpGUI6sy7InvNKjAsHEBz3B3YtCpBtCYqmR7
         +Pi3aF8lEMWadHf/WQ7zNExy7P0H2ibz3IXyhuTFLJEw5XDA39jfmy2x659BSOudxnXv
         n2b0+eDgzTxfnwEbiFGntmTIxGJd0zBvcHgghmBP5HS5I6RIA5Cn5mzV2+QJXu84ReIN
         e8fPkg3OHdIYNtHceqMVQ8IfpxGCnuUw9grJtfp+uV1KiC0nawD4v/AS61Kx1xgT8UY/
         Qt8AklI7fmuIOPdMapzuVoNLLkIxaeVYxZzYPCStVy5Gs9kWcIjLyelz3YvdKUfYLZme
         f5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760910192; x=1761514992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYhtkFNaT6hVSLlWHWHG49KT7TJItYuebittp1GOm1g=;
        b=OSY1XMMBGeSrhzIAxGYADjaKoB9XutLuQlp8ScdKGSlZ7oDVMA0Qch3CL87Z5VJLKh
         5rcwfacPRJf63psJldjcVmYxv+8ND1T0ICefjeczOB7/R8pREvFrdBCbku2ih6FFTu/R
         8X61n9+Q3NHDFyuqgrbjpPchtKoWYedBDpmfWyRmoL4hICCCHio4mGDIh3Tzg52MsfPO
         UkVQBxl2CZn4pvZZzogtc9/SvnhK34NCSjpXKC9X6bw2I6UiIte6EEA+RYaANrC04NyY
         I0ccjqHSXkJojozs4BON1ATbwp2pK+6RyPKmeRipieRHx2f6riUpHI3DbQOIj8/aZ+Ua
         lgrw==
X-Gm-Message-State: AOJu0YxnSPcXWXc6sP4jHaDxCfXuE9L8nCFe4UoqgKi6p/mJYFlVkoeo
	qhK1kGJWfOpnnl8/aIlztU1wbsIWqpl+LPWu0uIt7l1iyfDryDMNXebQ
X-Gm-Gg: ASbGncvBPleB2WM8FT+JyQF6I6pBpTLgpN12nd8+vbmhEULQ694TRlncH7YYQ1KWBWS
	9RSqoD5Z9/6YzuNMExQEW/KO1I/U+NH3oXs6pQ9BzfDFJSkKlytJ6ATooLZWoRBFe9IZc3hNgUm
	hFRvkpkqzl6SRNhCsm/4T/+5j6mdqwXy0qWMzG9GZ6a2ed8QjphSusaab7TcL5dgF0OPV4KRhQk
	VMW20SoCMUGvWdxd7utAWkTZElJuF3kw7Z3lahza8HJumnldsWV+TaA6K+UxDpL5PvBiPZvb8NT
	ffgtxhQL/7TajgegpkoJy7RvqnoGcIdsGjdWYRsKUDaAVIa+odMGd2Kp4ns0sI+6yzJX/BYVHI3
	NUtOp6MoO5UDtwtifAn+HO6m3TkP6tsHX/CudNp/ovaXIYPm6xx8patL1P1rbR4RfOsM=
X-Google-Smtp-Source: AGHT+IEccrrXEJD3s6OMYbBUvL6YIHVHeE/qRhkO2crqOi3Y/aWkGn/9+DVuRqho0TBNliCQtaJsww==
X-Received: by 2002:a05:6512:61a:b0:591:d903:4381 with SMTP id 2adb3069b0e04-591d9034751mr2196467e87.33.1760910191978;
        Sun, 19 Oct 2025 14:43:11 -0700 (PDT)
Received: from curiosity ([5.188.167.4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def167e8sm1896349e87.65.2025.10.19.14.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 14:43:10 -0700 (PDT)
Date: Mon, 20 Oct 2025 00:43:07 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nam Cao <namcao@linutronix.de>,
	Joel Granados <joel.granados@kernel.org>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 6/6] riscv: vector: initialize vlenb on the first
 context switch
Message-ID: <aPVba5_moA6g-0Uo@curiosity>
References: <20251007115840.2320557-1-geomatsi@gmail.com>
 <20251007115840.2320557-7-geomatsi@gmail.com>
 <CAFTtA3PyEnscQx+JtM3wBb0YZJxFjoJp4JB6QJQXbN6q3HVFyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFTtA3PyEnscQx+JtM3wBb0YZJxFjoJp4JB6QJQXbN6q3HVFyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_144314_460512_F5B315A8 
X-CRM114-Status: GOOD (  26.09  )
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

T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMDI6NTQ6MzlQTSAtMDUwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IEhpIFNlcmdleSwKPiAKPiBPbiBUdWUsIE9jdCA3LCAyMDI1IGF0IDY6NTjigK9BTSBTZXJn
ZXkgTWF0eXVrZXZpY2ggPGdlb21hdHNpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIHZz
dGF0ZSBpbiB0aHJlYWRfc3RydWN0IGlzIHplcm9lZCB3aGVuIHRoZSB2ZWN0b3IgY29udGV4dCBp
cwo+ID4gaW5pdGlhbGl6ZWQuIFRoYXQgaW5jbHVkZXMgcmVhZC1vbmx5IHJlZ2lzdGVyIHZsZW5i
LCB3aGljaCBob2xkcwo+ID4gdGhlIHZlY3RvciByZWdpc3RlciBsZW5ndGggaW4gYnl0ZXMuIFRo
aXMgemVyb2VkIHN0YXRlIHBlcnNpc3RzCj4gPiB1bnRpbCBtc3RhdHVzLlZTIGJlY29tZXMgJ2Rp
cnR5JyBhbmQgYSBjb250ZXh0IHN3aXRjaCBzYXZlcyB0aGUKPiA+IGFjdHVhbCBoYXJkd2FyZSB2
YWx1ZXMuCj4gPgo+ID4gVGhpcyBjYW4gZXhwb3NlIHRoZSB6ZXJvIHZsZW5iIHZhbHVlIHRvIHRo
ZSB1c2VyLXNwYWNlIGluIGVhcmx5Cj4gPiBkZWJ1ZyBzY2VuYXJpb3MsIGUuZy4gd2hlbiBwdHJh
Y2UgYXR0YWNoZXMgdG8gYSB0cmFjZWQgcHJvY2Vzcwo+ID4gZWFybHksIGJlZm9yZSBhbnkgdmVj
dG9yIGluc3RydWN0aW9uIGV4Y2VwdCB0aGUgZmlyc3Qgb25lIHdhcwo+ID4gZXhlY3V0ZWQuCj4g
Pgo+ID4gRml4IHRoaXMgYnkgZm9yY2luZyB0aGUgdmVjdG9yIGNvbnRleHQgc2F2ZSBvbiB0aGUg
Zmlyc3QgY29udGV4dCBzd2l0Y2guCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IE1hdHl1
a2V2aWNoIDxnZW9tYXRzaUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC92ZWN0b3IuYyB8IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gaW5kZXggOTAxZTY3YWRmNTc2Li4zZGQyMmE3MWFhMTgg
MTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYwo+ID4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMKPiA+IEBAIC0xMjAsNiArMTIwLDcgQEAgc3RhdGljIGlu
dCByaXNjdl92X3RocmVhZF96YWxsb2Moc3RydWN0IGttZW1fY2FjaGUgKmNhY2hlLAo+ID4KPiA+
ICAgICAgICAgY3R4LT5kYXRhcCA9IGRhdGFwOwo+ID4gICAgICAgICBtZW1zZXQoY3R4LCAwLCBv
ZmZzZXRvZihzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSwgZGF0YXApKTsKPiA+ICsKPiA+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+IEBAIC0yMTYsOCArMjE3LDExIEBAIGJvb2wg
cmlzY3Zfdl9maXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICAgICAg
ICAgICAgICAgICBmb3JjZV9zaWcoU0lHQlVTKTsKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4g
dHJ1ZTsKPiA+ICAgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICByaXNjdl92X3ZzdGF0ZV9vbihy
ZWdzKTsKPiA+ICAgICAgICAgcmlzY3Zfdl92c3RhdGVfc2V0X3Jlc3RvcmUoY3VycmVudCwgcmVn
cyk7Cj4gPiArICAgICAgIHNldF90c2tfdGhyZWFkX2ZsYWcoY3VycmVudCwgVElGX1JJU0NWX1Zf
Rk9SQ0VfU0FWRSk7Cj4gPiArCj4gCj4gSSBhbSBhZnJhaWQgdGhhdCB0aGlzIGFwcHJvYWNoIGNh
biByZXN1bHQgaW4gYSBzZWN1cml0eSBpc3N1ZSB3aGVyZSBhCj4gY29udGV4dCBzd2l0Y2ggaGFw
cGVucyBiZWZvcmUgdGhlIHYtcmVzdG9yZSBwYXJ0IG9mIHRoZSBjdXJyZW50Cj4gcHJvY2Vzcywg
Y2hlYXRpbmcgdGhlIGtlcm5lbCB0byBzdG9yZSBzdGFsZSB2LXJlZ3Mgb250byB0aGUgY3VycmVu
dAo+IGNvbnRleHQgbWVtb3J5LiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgaGFuZGxlciBpcyBydW4g
d2l0aCBpcnEgZW5hYmxlZAo+IHNvIHByZWVtcHRpb24gaXMgYWxsb3dlZC4KPiAKPiBJIHdvdWxk
IGV4cGVjdCBzaW1wbHkgaW5pdGlhbGl6aW5nIHRoZSB2bGViIGluIHJpc2N2X3ZfdGhyZWFkX3ph
bGxvYywKPiBwZXJoYXBzIGRyb3BwaW5nIHRoZSAieiIgaW4gdGhlIG5hbWUgdG8gcHJldmVudCBj
b25mdXNpb24uCgpPaywgc28gd2UgY2FuIGp1c3Qgc2V0ICdjdHgtPnZsZW5iID0gcmlzY3Zfdl92
c2l6ZSAvIDMyJyBpbiB0aGUgcmVuYW1lZApyaXNjdl92X3RocmVhZF9hbGxvYyBmdW5jdGlvbi4g
QnV0IG5vdGUsIHRoYXQgdy9vIGZvcmNlZCBjb250ZXh0IHNhdmUKd2UgaW1wbGljaXRseSByZXNl
dCB0aGUgdmVjdG9yIGNvbmZpZ3VyYXRpb24gdG8gJ2FsbCB6ZXJvcycsIG92ZXJ3cml0aW5nCnRo
ZSBoYXJkd2FyZSBkZWZhdWx0cy4KCkJ5IHRoZSB3YXksIGNvdWxkIHlvdSBwbGVhc2UgZWxhYm9y
YXRlIGEgbGl0dGxlIGJpdCBtb3JlIGFib3V0IHlvdXIgc2VjdXJpdHkKY29uY2VybnMgd2l0aCB0
aGUgVElGX1JJU0NWX1ZfRk9SQ0VfU0FWRSBhcHByb2FjaCA/IFRoZSBhdG9taWMgYW5kIHBlci1w
cm9jZXNzCmZsYWcgbW9kaWZpY2F0aW9uIGxvb2tzIHNhZmUgdG8gbWUsIHNvIEknZCBsaWtlIHRv
IHVuZGVyc3RhbmQgd2hhdCBJIGFtCm1pc3NpbmcuCgpUaGFua3MsClNlcmdleQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
