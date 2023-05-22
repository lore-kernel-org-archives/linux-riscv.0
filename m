Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5E0C7EE2A
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzP7XxAIayVDXQNb/GYMVYMz48lvvn5wxq2GnCFVe0o=; b=4tl3e+JeyOoAN3
	NI58d63wt3x+uY6XSvw7UrTXXeuQxRP6yrfRrEzLwFo0HfUUqCj3GwlEtcVRDrowqdDKVc+UO0tKe
	XlRA9x6Pd9KoM9GVTgXu2jX+oJUBIw214ICZjtjYMgMnJJnabCAfXXC2tO+4ZXDuCpZuNWHeR6ITK
	nZDGMjDeSoBRY/Q1yj23yQZQ/1yzEqCWytFgETLsrdByQOLUMJ6tyJhkwmS9VOXqDywpAUnuRw6uz
	E2TO6cNM4xEtkuxjMi3jS1YtXPwZvh0Ibs6JWmm67Mhz4eZGWzREtGvcjw4XzhnUHSCuUpSkHmYTi
	HZE8/N7mS6KeWXDq8xNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q121f-005tdV-2P;
	Mon, 22 May 2023 09:40:23 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q121c-005tcm-0N
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 09:40:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so694782e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 May 2023 02:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684748416; x=1687340416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUTd018zzttGKfcxqId+9qTE/jC/9Fv0gPOqDPW0Zg8=;
        b=njW3pcP6cXCxDJCokQLvCm8e1Zh0bVvD5SPleVjyIsfFEPUKbP3s3KecV3NDINQPBx
         4lsQifOMwhEUGuAzv8jU7fy6VAKbGv+p1FdD/jPPgop87GS/M23E18pOf44pR5PZSLtz
         zIYCbEgjHk4ewG32o5qdWpOuBEE0585WluRe6NN1HLapN6oo3AuIyf6iyFUEzm3reoIm
         x+rwrn0nLPHG9KrVI5vgab4ikHfCAcfXH4egboji1uKYg0S3qNmZ8WFoLk1oohiOxWqN
         PvIH7Z4JQcV/hjd1evfOO2QU04EJAaesyvn7R4pwwrKzvn4aGdKAbPROsVUpGmC8Hkco
         JnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684748416; x=1687340416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUTd018zzttGKfcxqId+9qTE/jC/9Fv0gPOqDPW0Zg8=;
        b=AvHr+WIPyv+MyaphGuNcRhu9pvYleVitKtYa63XtKT1ywtHjNHg1+qmF1ColD8PGPp
         6AMVgPrUQmcih5WzVbXL9cwNhsJdcpDgv/CVj98Z4eY+/THHeFa1OQPnipbkJuvKrH1Y
         +6TJq7/ziY2Cn2svdm52NVoTRQxV0D7iHTuO4jP3FtMo9/+hJtxk78npPOvVZ2T79raR
         BvvMrAOA95+Rd2teJZBhTrkWY22vO1fh8Z9AUaNNJutHTw3quVUyjf5WcZZvuyId6U8K
         8ACNC4X60azJFxrNw8NiIN0rYppYQ8yxUwezGpzNa0AbPBQCLRXJITWqRJqUBaJA2o7r
         OtiA==
X-Gm-Message-State: AC+VfDx77yTNG/8wIqCe5iSgTF8if+LZXWOLgIQ4UnlmN2AGqw1MMm1G
	bVqeSN6+AhUrb0BCLn6fONrfiGrCwO8zYdSeXCKMfw==
X-Google-Smtp-Source: ACHHUZ7TfPVWU2d1ZRV7ILxTF1F3ImBz+clNcYREWZAyN+RhKlBYRUaENzX1x03Sz+JXcey/OqsRzPlQIVHlneJV/rA=
X-Received: by 2002:ac2:42ce:0:b0:4f3:8143:765 with SMTP id
 n14-20020ac242ce000000b004f381430765mr3018660lfl.27.1684748416036; Mon, 22
 May 2023 02:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-12-andy.chiu@sifive.com>
 <20230518-external-sixteen-f2d2ae444547@spud>
In-Reply-To: <20230518-external-sixteen-f2d2ae444547@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 22 May 2023 17:40:04 +0800
Message-ID: <CABgGipUcuQTBbJkA5276NH57FWPxDT14my8NpwDL9VHycL6+5w@mail.gmail.com>
Subject: Re: [PATCH -next v20 11/26] riscv: Allocate user's vector context in
 the first-use trap
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Jones <ajones@ventanamicro.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Liao Chang <liaochang1@huawei.com>, Jisheng Zhang <jszhang@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, Guo Ren <guoren@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Mattias Nissler <mnissler@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_024020_197223_99DABBD3 
X-CRM114-Status: GOOD (  25.26  )
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

SGkgQ29ub3IsCgpPbiBGcmksIE1heSAxOSwgMjAyMyBhdCAxOjQ34oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTWF5IDE4LCAyMDIzIGF0IDA0
OjE5OjM0UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+IFZlY3RvciB1bml0IGlzIGRpc2Fi
bGVkIGJ5IGRlZmF1bHQgZm9yIGFsbCB1c2VyIHByb2Nlc3Nlcy4gVGh1cywgYQo+ID4gcHJvY2Vz
cyB3aWxsIHRha2UgYSB0cmFwIChpbGxlZ2FsIGluc3RydWN0aW9uKSBpbnRvIGtlcm5lbCBhdCB0
aGUgZmlyc3QKPiA+IHRpbWUgd2hlbiBpdCB1c2VzIFZlY3Rvci4gT25seSBhZnRlciB0aGVuLCB0
aGUga2VybmVsIGFsbG9jYXRlcyBWCj4gPiBjb250ZXh0IGFuZCBzdGFydHMgdGFrZSBjYXJlIG9m
IHRoZSBjb250ZXh0IGZvciB0aGF0IHVzZXIgcHJvY2Vzcy4KPiA+Cj4gPiBTdWdnZXN0ZWQtYnk6
IFJpY2hhcmQgSGVuZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPgo+ID4gTGlu
azogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8zOTIzZWVlZS1lNGRjLTA5MTEtNDBiZi04NGMz
NGFlZTk2MmRAbGluYXJvLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogQW5keSBDaGl1IDxhbmR5LmNo
aXVAc2lmaXZlLmNvbT4KPiA+IC0tLQo+ID4gSGV5IEhlaWtvIGFuZCBDb25vciwgSSBhbSBkcm9w
cGluZyB5b3UgZ3V5cycgQS1iLCBULWIsIGFuZCBSLWIgYmVjYXVzZSBJCj4gPiBhZGRlZCBhIGNo
ZWNrIGluIHJpc2N2X3ZfZmlyc3RfdXNlX2hhbmRsZXIoKS4KPgo+ID4gK2Jvb2wgcmlzY3Zfdl9m
aXJzdF91c2VfaGFuZGxlcihzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ICt7Cj4gPiArICAgICB1
MzIgX191c2VyICplcGMgPSAodTMyIF9fdXNlciAqKXJlZ3MtPmVwYzsKPiA+ICsgICAgIHUzMiBp
bnNuID0gKHUzMilyZWdzLT5iYWRhZGRyOwo+ID4gKwo+ID4gKyAgICAgLyogRG8gbm90IGhhbmRs
ZSBpZiBWIGlzIG5vdCBzdXBwb3J0ZWQsIG9yIGRpc2FibGVkICovCj4gPiArICAgICBpZiAoIWhh
c192ZWN0b3IoKSB8fCAhKGVsZl9od2NhcCAmIENPTVBBVF9IV0NBUF9JU0FfVikpCj4gPiArICAg
ICAgICAgICAgIHJldHVybiBmYWxzZTsKPgo+IFJlbWluZCBtZSBwbGVhc2UsIGluIHdoYXQgc2l0
dWF0aW9uIGlzIHRoaXMgYWN0dWFsbHkgZXZlbiBwb3NzaWJsZT8KPiBUaGUgQ09NUEFUX0hXQ0FQ
X0lTQV9WIGZsYWcgb25seSBnZXRzIHNldCBpZiBDT05GSUdfUklTQ1ZfSVNBX1YgaXMKPiBlbmFi
bGVkICYgdiBpcyBpbiB0aGUgRFQuCj4gaGFzX3ZlY3RvcigpIGlzIGJhY2tlZCBieSBkaWZmZXJl
bnQgdGhpbmdzIHdoZXRoZXIgYWx0ZXJuYXRpdmVzIGFyZQo+IGVuYWJsZWQgb3Igbm90LiBXaXRo
IGFsdGVybmF0aXZlcywgaXQgZGVwZW5kcyBvbiB0aGUgYml0IGJlaW5nIHNldCBpbgo+IHRoZSBy
aXNjdl9pc2EgYml0bWFwICYgdGhlIEtjb25maWcgb3B0aW9uLgo+IFdpdGhvdXQgYWx0ZXJuYXRp
dmVzIGl0IGlzIGJhY2tlZCBieSBfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKCkKPiB3
aGljaCBvbmx5IGRlcGVuZHMgaW4gdGhlIHJpc2N2X2lzYSBiaXRtYXAuCj4gU2luY2UgdGhlIGJp
dCBpbiB0aGUgYml0bWFwIGRvZXMgbm90IGdldCBjbGVhcmVkIGlmIENPTkZJR19SSVNDVl9JU0Ff
Vgo+IGlzIG5vdCBzZXQsIHVubGlrZSB0aGUgZWxmX2h3Y2FwIGJpdCB3aGljaCBkb2VzLCBpdCBz
ZWVtcyBsaWtlIHRoaXMKPiBtaWdodCBiZSB0aGUgY29uZGl0aW9uIHlvdSBhcmUgdHJ5aW5nIHRv
IHByZXZlbnQ/Cj4KCkluIGZhY3QgdGhlIGNhc2UgeW91IG1lbnRpb25lZCBpcyBwcmV2ZW50ZWQg
YnkgS2NvbmZpZyBpdHNlbGYuIFRvIGJlCm1vcmUgc3BlY2lmaWMsIHJpc2N2X3ZfZmlyc3RfdXNl
X2hhbmRsZXIoKSBhbHdheXMgcmV0dXJucyBmYWxzZSBpZgpDT05GSUdfUklTQ1ZfSVNBX1YgaXMg
bm90IHNldC4gSW4gc3VjaCBjb25maWcsIHRoZSBmdW5jdGlvbiBpcyBkZWZpbmVkCmFzIGFuIGlu
bGluZSB0aGF0IHJldHVybnMgZmFsc2UgaW4gaW5jbHVkZS9hc20vdmVjdG9yLmgsIGFuZAprZXJu
bC92ZWN0b3IuYyBpcyBub3QgY29tcGlsZWQuCgpUaGUgY2FzZSB0aGF0IEkgaW50ZW5kZWQgdG8g
cHJvdGVjdCBpcyBhbm90aGVyIHNjZW5hcmlvLiBlLmcuIElmIGEKbXVsdGljb3JlIHN5c3RlbSBo
YXMgZGlmZmVyZW50IFZMRU5zIGFjcm9zcyBjb3Jlcywgd2l0aApDT05GSUdfUklTQ1ZfSVNBX1Yg
c2V0LiBTaW5jZSB0aGlzIHNlcmllcyBhc3N1bWVzIGFuIFNNUCBzeXN0ZW0sIGl0CnR1cm5zIG9m
ZiBWIGluIEVMRl9IV0NBUCBpZiBpdCBkZXRlY3RzIHVuZXZlbiBWTEVOcyBkdXJpbmcgc21wIGJv
b3QuCkluIHRoaXMgY2FzZSB3ZSBtdXN0IG5vdCBoYW5kbGUgdGhlIGZpcnN0LXVzZSB0cmFwIGlm
IHRoZSB1c2VyIHN0aWxsCmV4ZWN1dGVzIFYgaW5zdHJ1Y3Rpb24gYW55d2F5LgoKPiBJZiBzbywK
PiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
Pgo+IE90aGVyd2lzZSwgcGxlYXNlIGxldCBtZSBrbm93IHdoZXJlIEkgaGF2ZSBnb25lIHdyb25n
IQo+Cj4gVGhhbmtzLAo+IENvbm9yLgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
