Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2586FC41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IKwNEW/7iR4mVBVxKplSZzwn8IrtA984lCUJOJmi+B8=; b=n2kxa4xk26pRBn
	zRhlO6073IFH4ekDt/YM2gw11M7Ch4a3hy6dc2V46ZNnSE34RIBZk2bgK5kifU5IVl3DPf2CQJjYR
	scRbo+22X2Aa9LUAKiExeHTut627EMjW6CIwkJ8qWoli3ODG2TAaQPnqsDgQV3Z/uWjr9gspP0O4p
	KhEwVgb8x9sWlpYUAT9qBD4Ic94P8sQ7QvXCjqmWEATTgzYSM6NcBrkkeceNqjZP9nWVyV5PCfQS/
	tO5XAMG7Cu74Wcj+aKD5fp7jSbgqPpRT15KE9IzkXSo3ltEah8NLTCz57LJBrJHZo62JE1BI92Lmr
	lncdI02k75aePuU5YtDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXNn-004sPY-2X;
	Fri, 22 Dec 2023 04:43:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXNj-004sP3-2q
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703220210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tb3jo9fkDistC/Bb96L+r4e+sXlv7gcKU05hItOf14A=;
	b=gihHgd3+QFmFscAzd8kQZs4sM+LHiG9vqac8fT7QaMXEZylDzirj4psnyHX/e6SyPGmiAK
	HSqGSAkJi6Id1h8i3QcuXSzCA8C9go/R/OHyl3nT1L3UWguEwCcXEY2UF17KmfEvNQAVJ/
	Bm+qH84h9UNhwZDP91w6DsJohgeN2Jo=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-y0oPIs4ZMw-JMibAPnhgnw-1; Thu, 21 Dec 2023 23:43:29 -0500
X-MC-Unique: y0oPIs4ZMw-JMibAPnhgnw-1
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d3f888ee39so6368295ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:43:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703220208; x=1703825008;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tb3jo9fkDistC/Bb96L+r4e+sXlv7gcKU05hItOf14A=;
        b=LiNfMT4vlVnzcqCklkg4D8Y0XniQFw8emRaFqUuKkWbFGEqvzrnG9hcaVzksgAEHUE
         7DewnQwRi6WoB9J+keujuI1U/krAMFWq3cmsRHTm6Nv/HiOvoXLn50m5CzWmXHcm223o
         lw3qEX9cjC3nZNnG8vV7FANIbiITeWoM9De30Uk3Sla+0Vjd4ZBT1tdxl0tCVOa8wLV9
         roy8J0h2mXPG3SrHDODxcwvnfqBDgKCLNXLhbld0sZAA55jUt35dsNL/3xOlnmR9hIQB
         fEuSHyjbkra3+ez6G4z6QRjOnNOcUoIZr9tHdYZJNaTrYa51H9BEEVH5j3fRwr+7POJ6
         ai5Q==
X-Gm-Message-State: AOJu0YwzXr1DS2KcOeU+ZQmPJZzRbplGYNkbBI4Kdsqx9Y1x8i4kmK9h
	4gHj21IBodkNWKjW6E5ffmF+TjT+jneygduGptJQGmV4gAEetigIQiSbSbYLbSHXqVhMEGqBD/X
	lOtBeYJ1cxBdqZvJatf+GakaSxW4qSavrsWMa
X-Received: by 2002:a17:902:780e:b0:1d3:abba:39b2 with SMTP id p14-20020a170902780e00b001d3abba39b2mr487018pll.55.1703220208130;
        Thu, 21 Dec 2023 20:43:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkXxqoVlDlQ8bIhrOzYju2iBkts8tdgjz0JPgCy8zVYER40SQLv9aGh31ntsmczzWYsMWeeA==
X-Received: by 2002:a17:902:780e:b0:1d3:abba:39b2 with SMTP id p14-20020a170902780e00b001d3abba39b2mr487010pll.55.1703220207808;
        Thu, 21 Dec 2023 20:43:27 -0800 (PST)
Received: from localhost.localdomain ([2804:1b3:a802:7496:88a7:1b1a:a837:bebf])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902704900b001d05456394csm2477010plt.28.2023.12.21.20.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 20:43:27 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: Leonardo Bras <leobras@redhat.com>,
	linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Fri, 22 Dec 2023 01:43:07 -0300
Message-ID: <ZYUT22KmGJ1tJSWx@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com>
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org> <ZYUD4C1aXWt2oFJo@LeoBras> <CAJF2gTSiaNWkXS6rc+3OSZfnFqG2d7btzjrd-L1mBgAVu3ym3A@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_204332_009578_EA7B6EA9 
X-CRM114-Status: GOOD (  31.31  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MjY6MTlQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIERlYyAyMiwgMjAyMyBhdCAxMTozNeKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2Jy
YXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6
NDY6NTlBTSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiA+IEZyb206IEd1byBS
ZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+ID4KPiA+ID4gV2hlbiB0aGUgdGFzayBp
cyBpbiBDT01QQVQgbW9kZSwgdGhlIGFyY2hfZ2V0X21tYXBfZW5kIHNob3VsZCBiZSAyR0IsCj4g
PiA+IG5vdCBUQVNLX1NJWkVfNjQuIFRoZSBUQVNLX1NJWkUgaGFzIGNvbnRhaW5lZCBpc19jb21w
YXRfbW9kZSgpCj4gPiA+IGRldGVjdGlvbiwgc28gY2hhbmdlIHRoZSBkZWZpbml0aW9uIG9mIFNU
QUNLX1RPUF9NQVggdG8gVEFTS19TSVpFCj4gPiA+IGRpcmVjdGx5Lgo+ID4KPiA+IG9rCj4gPgo+
ID4gPgo+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+ID4gPiBGaXhlczogYWRkMmNj
NmI2NTE1ICgiUklTQy1WOiBtbTogUmVzdHJpY3QgYWRkcmVzcyBzcGFjZSBmb3Igc3YzOSxzdjQ4
LHN2NTciKQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFi
YS5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+
ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggfCA2ICsr
LS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+IGluZGV4IGYx
OWY4NjFjZGE1NC4uMWY1MzhmYzQ0NDhkIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cHJvY2Vzc29yLmgKPiA+ID4gQEAgLTE2LDE1ICsxNiwxMyBAQAo+ID4gPgo+ID4gPiAgI2lmZGVm
IENPTkZJR182NEJJVAo+ID4gPiAgI2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAoVUwoMSkg
PDwgKE1NQVBfVkFfQklUUyAtIDEpKQo+ID4gPiAtI2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAg
ICAgICAgICAgIFRBU0tfU0laRV82NAo+ID4gPiArI2RlZmluZSBTVEFDS19UT1BfTUFYICAgICAg
ICAgICAgICAgIFRBU0tfU0laRQo+ID4KPiA+IEl0IG1lYW5zIFNUQUNLX1RPUF9NQVggd2lsbCBi
ZSBpbiA2NEJJVDoKPiA+IC0gVEFTS19TSVpFXzMyIGlmIGNvbXBhdF9tb2RlPXkKPiA+IC0gVEFT
S19TSVpFXzY0IGlmIGNvbXBhdF9tb2RlPW4KPiA+Cj4gPiBNYWtlcyBzZW5zZSBmb3IgbWUuCj4g
Pgo+ID4gPgo+ID4gPiAgI2RlZmluZSBhcmNoX2dldF9tbWFwX2VuZChhZGRyLCBsZW4sIGZsYWdz
KSAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICAgIHVuc2lnbmVkIGxv
bmcgbW1hcF9lbmQ7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgICAg
ICB0eXBlb2YoYWRkcikgX2FkZHIgPSAoYWRkcik7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ID4gLSAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxFRChDT05GSUdfQ09N
UEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ID4gPiAtICAgICAgICAgICAgIG1tYXBfZW5k
ID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gLSAgICAgZWxz
ZSBpZiAoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAgICAgICAgICAgICAgICAgICAgICBcCj4g
PiA+ICsgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAg
ICAgICAgICAgXAo+ID4gPiAgICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gICAgICAgZWxzZSBpZiAoKCgoX2FkZHIpID49
IFZBX1VTRVJfU1Y0OCkpICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y0OCkpIFwKPiA+ID4gICAg
ICAgICAgICAgICBtbWFwX2VuZCA9IFZBX1VTRVJfU1Y0ODsgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gPgo+ID4KPiA+IEkgZG9uJ3QgdGhpbmsgSSBnb3QgdGhpcyBjaGFuZ2UsIG9yIGhvdyBp
dCdzIGNvbm5lY3RlZCB0byB0aGUgY29tbWl0IG1zZy4KPiBUaGUgYWJvdmUgaXMganVzdCBjb2Rl
IHNpbXBsaWZpY2F0aW9uOyBpZiBTVEFDS19UT1BfTUFYIGlzIFRBU0tfU0laRSwgdGhlbgo+IAo+
ICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxFRChDT05GSUdfQ09NUEFUKSAmJiBp
c19jb21wYXRfdGFzaygpKSkgXAo+ICAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9N
QVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFf
VVNFUl9TVjU3KSAgICAgICAgICAgICAgICAgICAgICAgXAo+IAo+IGlzIGVxdWFsIHRvOgo+IAo+
ICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykgICAgICAg
ICAgICBcCgpJIGFtIGZhaWxpbmcgdG8gdW5kZXJzdGFuZCBleGFjdGx5IGhvdyBhcmUgdGhleSBl
cXVhbC4KSSBtZWFuLCB3aGF0IGluIHlvdXIgU1RBQ0tfVE9QX01BWCBjaGFuZ2UgbWFkZSB0aGVt
IGVxdWFsPwoKU2VlIGJlbG93LCB0aGUgYmVoYXZpb3IgY2hhbmdlZDogCj4gCj4gPgo+ID4gQmVm
b3JlOgo+ID4gLSBhZGRyID09IDAsIG9yIGFkZHIgPiAyXjU3LCBvciBjb21wYXQ6IG1tYXBfZW5k
ID0gU1RBQ0tfVE9QX01BWAo+ID4gLSAyXjQ4IDwgYWRkciA8IDJeNTc6IG1tYXBfZW5kID0gMl40
OAo+ID4gLSAwIDwgYWRkciA8IDJeNDggOiBtbWFwX2VuZCA9IDJeMzkKPiA+Cj4gPiBOb3c6Cj4g
PiAtIGFkZHIgPT0gMCwgb3IgYWRkciA+IDJeNTc6IG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWAo+
ID4gLSAyXjQ4IDwgYWRkciA8IDJeNTc6IG1tYXBfZW5kID0gMl40OAo+ID4gLSAwIDwgYWRkciA8
IDJeNDggOiBtbWFwX2VuZCA9IDJeMzkKPiA+Cj4gPiBJSVVDIGNvbXBhdCBtb2RlIGFkZHIgd2ls
bCBiZSA8IDJeMzIsIHNvIHdpbGwgYWx3YXlzIGhhdmUgbW1hcF9lbmQgPSAyXjM5Cj4gPiBpZiBh
ZGRyICE9IDAuIElzIHRoYXQgZGVzaXJlYWJsZT8KPiA+IChpZiBub3QsIGFib3ZlIGNoYW5nZSBp
cyB1bm5lZWRlZCkKPiA+CgpeCgpXaXRoIHlvdXIgY2hhbmdlIG9uIFNUQUNLX1RPUF9NQVggb25s
eSAobm90IGNoYW5naW5nIGFyY2hfZ2V0X21tYXBfZW5kKSwgCnlvdSB3b3VsZCBoYXZlOgoKLSBj
b21wYXRfbW9kZSAmICgwIDwgYWRkciA8IDJeMzIpIAktPiBtbWFwX2VuZCA9IDJeMzIKLSBub24t
Y29tcGF0LCBhZGRyID09IDAsIG9yIGFkZHIgPiAyXjU3IC0+IG1tYXBfZW5kID0gVEFTS19TSVpF
XzY0Ci0gbm9uLWNvbXBhdCwgKDJeNDggPCBhZGRyIDwgMl41NykJLT4gbW1hcF9lbmQgPSAyXjQ4
Ci0gbm9uLWNvbXBhdCwgKDAgPCBhZGRyIDwgMl40OCkgCS0+IG1tYXBfZW5kID0gMl4zOQoKV2hp
Y2ggc2VlbXMgbW9yZSBsaWtlbHksIGJhc2VkIG9uIENoYXJsaWUgY29tbWVudHMuCgpUaGFua3Ms
CkxlbwoKPiA+IEFsc28sIHVucmVsYXRlZCB0byB0aGUgY2hhbmdlOgo+ID4gLSAyXjQ4IDwgYWRk
ciA8IDJeNTc6IG1tYXBfZW5kID0gMl40OAo+ID4gSXMgdGhlIGFib3ZlIGNvcnJlY3Q/Cj4gPiBJ
dCBsb29rcyBsaWtlIGl0IHNob3VsZCBiZSAyXjU3IGluc3RlYWQsIGFuZCBhIG5ldyBpZiBjbGF1
c2UgZm9yCj4gPiAyXjMyIDwgYWRkciA8IDJeNDggc2hvdWxkIGhhdmUgbW1hcF9lbmQgPSAyXjQ4
Lgo+ID4KPiA+IERvIEkgZ2V0IGl0IHdyb25nPwo+IE1heWJlIEkgc2hvdWxkIG1vdmUgdGhpcyBp
bnRvIHRoZSBvcHRpbWl6YXRpb24gcGFydC4KPiAKPiA+Cj4gPiAoSSB3aWxsIHNlbmQgYW4gUkZD
ICdmaXhpbmcnIHRoZSBjb2RlIHRoZSB3YXkgSSBhbSB3aGlua2luZyBpdCBzaG91bGQgbG9vawo+
ID4gbGlrZSkKPiA+Cj4gPiBUaGFua3MsCj4gPiBMZW8KPiA+Cj4gPgo+ID4KPiA+Cj4gPgo+ID4g
PiAtLQo+ID4gPiAyLjQwLjEKPiA+ID4KPiA+Cj4gCj4gCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4g
IEd1byBSZW4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
