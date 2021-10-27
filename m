Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A994C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 07:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC5060ED4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 07:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CC5060ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/HtM4p3GxbLOf024e7UMkNd6Tmi539NremO8S/QdrE=; b=Q/47SBqFem43fi
	1xW4jg0NFA697haP2nyeFDUOr3deMxFP2gc+s75/JIHJ2h8NOQ752dJNrpcfIcez/sQT2MFipT0CN
	vZ12PQjw7oNdXfSGGjYM7gY4GIT1/UQAifmhrSrqih9I/DBq2syICy30gKCoIrIiAE5gW15V7hWL+
	/xkCOzu/rdOfedzfLTeQuEB/9W+NcMFbGodLyTHteeUSSmibgBe5X6NN0+eCZ/QeS8yOJ2z87LlPO
	oYeodTDsCyEO+kxgo0kX4jt7wFtBawUcu948Zqyn0fPK410XbLvgaOISkzboUQzD+bFx+18Zl52g4
	y3GeGu0/Gl+AUQvJIxJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdlR-004ED1-Qk; Wed, 27 Oct 2021 07:54:25 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdlO-004ECQ-R2
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 07:54:24 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4B7A13F176
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 07:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635321259;
 bh=jrIERodREqehysnV6gsM61G1ahaaesQ+KVjNvRfOpIo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=ep0T11q9uoj0kUewI9HjgYetNfyl4YiPWXnK/ZGdnA+OCWOJuCtnOJk0uuM8/nYqi
 C7VwlyIAXVxhgdF7o+t9g7V2CNjU7XlWXup8zOmSzrNDyhAaruaMqBj35RI8NZbzIN
 mmy28C/gL8xRhwXPvkeFEGm2NSp6M/R6KLOW5vMVqKN3CYkFDMSR5xWtzAK5SGG+qn
 9hGfsBd4RDZ66KKRqq/BV/VZkOHGNXAWrOuaPGOs4CEUxA0xMwKdoQHfpAmhUHSHwB
 /8VNfePfaEVbi2zZyhP85YqRUfPUndmZ9DNTy+IiYf60r5vDI503Tx+5BapNBtLZK+
 BDtKzvHDkNJvA==
Received: by mail-wm1-f72.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so890338wmj.8
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 00:54:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jrIERodREqehysnV6gsM61G1ahaaesQ+KVjNvRfOpIo=;
 b=Sz8501XB515o5F+ooHZGByHZQ/+rZ/6eKc/NIvlt6hQzgWzgrDS4JYn/k9TAv//9Pl
 wobnDKoBHHom2CbOO8r1L3lz20N41sxt3bCDbpcGZdjoN6mbv/4mH7UBFWuPPfRUoUUG
 3iNEizA5jxtB1Gri/l8mtanwMEwyvkMH4LfZjZpvzRhh3voGf0HELLJ28tKWflMk/Sho
 rMnb4lznAlhCFGy96QPc8nsEcj9fnKmPNiHWWG9TzBT8qKU9/FciNyeMHAkCjhZRXKMd
 gwzgA/E8iRSEf6jJ3B6FqUgM7mdiH1pFwS/QF3E8zuzVCEJn4DtZwlHVOBh3JOzwCU60
 Elfw==
X-Gm-Message-State: AOAM532iWkGQBUQv8jweJF9dl12KmWV7D64elSrGUXYHbvCQRtokqD9t
 l5An2fi1wDN/9Z3dcjudrFAwEvNaSwSBIx9MSm6uSq1kmTDqKKGlisa4PRkU3++K409wfH9BPbt
 tstG36O2wQGQQ9h/LJLNeMUvpB6N3BgP0/xtxT0NXYTC4vA==
X-Received: by 2002:a7b:cd16:: with SMTP id f22mr4132868wmj.42.1635321258929; 
 Wed, 27 Oct 2021 00:54:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6qDUvnuv6opusaRgyH+GKdjmFxmU7S/Ic0X3KxUzeyS5RGOxCGIbPbcPVKjnEkiGVgKpkog==
X-Received: by 2002:a7b:cd16:: with SMTP id f22mr4132838wmj.42.1635321258655; 
 Wed, 27 Oct 2021 00:54:18 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id s11sm13060053wrt.60.2021.10.27.00.54.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:54:18 -0700 (PDT)
Message-ID: <7b8233f4-b7d7-7142-3c09-4d5c3e06d287@canonical.com>
Date: Wed, 27 Oct 2021 09:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [RESEND PATCH V3 0/2] riscv: add RISC-V Svpbmt Standard Extension
 supports
Content-Language: en-US
To: Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com
Cc: Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 guoren@kernel.org, christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
 Christoph Hellwig <hch@lst.de>, liush@allwinnertech.com,
 lazyparser@gmail.com, drew@beagleboard.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, taiten.peng@canonical.com,
 aniket.ponkshe@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, Arnd Bergmann <arnd@arndb.de>, wens@csie.org,
 maxime@cerno.tech, Daniel Lustig <dlustig@nvidia.com>,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com
References: <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <mhng-ac32ff92-86cb-4377-ba63-de1856e84fb1@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_005423_102499_3B1AAA45 
X-CRM114-Status: GOOD (  27.63  )
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

T24gMTAvMjcvMjEgMDI6MTIsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+IE9uIFN1biwgMjQgT2N0
IDIwMjEgMjE6MDY6MDUgUERUICgtMDcwMCksIHdlZnVAcmVkaGF0LmNvbSB3cm90ZToKPj4gRnJv
bTogRnUgV2VpIDx3ZWZ1QHJlZGhhdC5jb20+Cj4+Cj4+IFRoaXMgcGF0Y2ggZm9sbG93cyB0aGXC
oCBSSVNDLVYgc3RhbmRhcmQgU3ZwYm10IGV4dGVuc2lvbiBpbgo+PiBwcml2aWxlZ2Ugc3BlYyB0
byBzb2x2ZSB0aGUgbm9uLWNvaGVyZW50IFNPQyBETUEgc3luY2hyb25pemF0aW9uCj4+IGlzc3Vl
cy4KPj4KPj4gVGhlIHN2cGJtdCBQVEUgZm9ybWF0Ogo+PiB8IDYzIHwgNjItNjEgfCA2MC04IHwg
NyB8IDYgfCA1IHwgNCB8IDMgfCAyIHwgMSB8IDAKPj4gwqAgTsKgwqDCoMKgIE1UwqDCoMKgwqAg
UlNXwqDCoMKgIETCoMKgIEHCoMKgIEfCoMKgIFXCoMKgIFjCoMKgIFfCoMKgIFLCoMKgIFYKPj4g
wqDCoMKgwqDCoMKgwqAgXgo+Pgo+PiBPZiB0aGUgUmVzZXJ2ZWQgYml0cyBbNjM6NTRdIGluIGEg
bGVhZiBQVEUsIHRoZSBiaXRzIFs2Mjo2MV0gYXJlIHVzZWQgYXMKPj4gdGhlIE1UIChha2EgTWVt
VHlwZSkgZmllbGQuIFRoaXMgZmllbGQgc3BlY2lmaWVzIG9uZSBvZiB0aHJlZSBtZW1vcnkgCj4+
IHR5cGVzCj4+IGFzIHNob3duIGluIHRoZSBmb2xsb3dpbmcgdGFibGXvvJoKPj4gTWVtVHlwZcKg
wqDCoMKgIFJJU0MtViBEZXNjcmlwdGlvbgo+PiAtLS0tLS0tLS0twqAgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IDAwIC0gUE1BwqDCoMKgIE5vcm1h
bCBDYWNoZWFibGUsIE5vIGNoYW5nZSB0byBpbXBsaWVkIFBNQSBtZW1vcnkgdHlwZQo+PiAwMSAt
IE5DwqDCoMKgwqAgTm9uLWNhY2hlYWJsZSwgaWRlbXBvdGVudCwgd2Vha2x5LW9yZGVyZWQgTWFp
biBNZW1vcnkKPj4gMTAgLSBJT8KgwqDCoMKgIE5vbi1jYWNoZWFibGUsIG5vbi1pZGVtcG90ZW50
LCBzdHJvbmdseS1vcmRlcmVkIEkvTyBtZW1vcnkKPj4gMTEgLSBSc3ZkwqDCoCBSZXNlcnZlZCBm
b3IgZnV0dXJlIHN0YW5kYXJkIHVzZQo+IAo+IERvIHlvdSBoYXZlIGEgcG9pbnRlciB0byB0aGUg
c3BlYyB0aGF0IGNvbnRhaW5zIHRoZXNlP8KgIEknbSBzcGVjaWZpY2FsbHkKPiB3b3JyaWVkIGFi
b3V0IHRoZXNlIHBhZ2UtYmFzZWQgYXR0cmlidXRlcyBiZWluZyBlbGlkZWQgd2hlbiBwYWdpbmcg
aXMKPiBvZmYgKGllLCBNLW1vZGUpLCB3aGljaCBoYXMgY2F1c2VkIGlzc3VlcyBpbiBzeXN0ZW1z
IEkndmUgd29ya2VkIHdpdGggaW4KPiB0aGUgcGFzdC7CoCBJJ20gYXNzdW1pbmcgdGhlcmUncyBz
b21ldGhpbmcgcmVsYXRlZCB0byB0aGlzIGluIHRoZSBzcGVjcywKPiBidXQgSSdtIHdvcnJpZWQg
d2UnbGwgbmVlZCBzb21lIHNvcnQgb2YgYWNrIGZyb20gTS1tb2RlIHRoYXQgaXQncyBiZWVuCj4g
c2V0dXAgdG8gd29yayB0aGF0IHdheS7CoCBPbmUgY291bGQgaW1hZ2luZSBhbiBNUFJWLWxpa2Ug
YXBwcm9hY2ggCj4gd29ya2luZywgYnV0IEkgZG9uJ3Qgc2VlIGVub3VnaCBpbiB0aGUgb2xkIHNw
ZWNzIGFuZCBJJ20gaGF2aW5nIHRyb3VibGUgCj4gZmlndXJpbmcgb3V0IHdoZXJlIHRoZSBjYW5v
bmljYWwgdmVyc2lvbiBvZiB0aGlzIGxpdmVzLgoKVGhlIGRyYWZ0IHZlcnNpb24gb2YgdGhlIHNw
ZWMgaXMgYXZhaWxhYmxlIGluIGNoYXB0ZXIgNiwgcCA4NyBvZgpodHRwczovL3Jhdy5naXRodWJ1
c2VyY29udGVudC5jb20vcmlzY3YvdmlydHVhbC1tZW1vcnkvbWFpbi9zcGVjcy82NjMtU3ZwYm10
LnBkZgoKQWNjb3JkaW5nIHRvIApodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2EvZ3JvdXBzLnJp
c2N2Lm9yZy9nL2lzYS1kZXYvYy9uT3JEOXQ5SW1Fdy9tL3RzdGptNFFiQUFBSiAKcmV2aWV3IGhh
cyBzdGFydGVkIFNlcCAxN3RoLgoKQmVzdCByZWdhcmRzCgpIZWlucmljaAoKPiAKPj4gVGhlIHN0
YW5kYXJkIHByb3RlY3Rpb25fbWFwW10gbmVlZG4ndCBiZSBtb2RpZmllZCBiZWNhdXNlIHRoZSAi
UE1BIgo+PiB0eXBlIGtlZXBzIHRoZSBoaWdoZXN0IGJpdHMgemVyby4KPj4gQW5kIHRoZSB3aG9s
ZSBtb2RpZmljYXRpb24gaXMgbGltaXRlZCBpbiB0aGUgYXJjaC9yaXNjdi8qIGFuZCB1c2luZwo+
PiBhIGdsb2JhbCB2YXJpYWJsZShfX3Jpc2N2X3N2cGJtdCkgYXMgX1BBR0VfRE1BX01BU0svSU8v
TkMgZm9yCj4+IHBncHJvdF9ub25jYWNoZWQgKCZ3cml0ZWNvbWJpbmUpIGluIHBndGFibGUuaC4K
Pj4gV2UgYWxzbyBhZGQgX1BBR0VfQ0hHX01BU0sgdG8gZmlsdGVyIFBGTiB0aGFuIGJlZm9yZS4K
Pj4KPj4gRW5hYmxlIGl0IGluIGRldmljZXRyZWUgLSAoQWRkICJtbXUtc3VwcG9ydHMtc3ZwYm10
IiBpbiBjcHUgbm9kZSkKPj4gwqAtIG1tdS1zdXBwb3J0cy1zdnBibXQKPiAKPiBNYXliZSB0aGlz
IGlzIGVub3VnaCBvZiBhbiBhY2ssIGJ1dCB3ZSdsbCBuZWVkIHRvIGhhdmUgc29tZSBwcmV0dHkK
PiBzcGVjaWZpYyBkb2N1bWVudGF0aW9uIGlmIHRoYXQncyB0aGUgY2FzZS7CoCBJdCdzIG5vdCBk
ZXNjcmliZWQgdGhhdCB3YXkgCj4gaW4gdGhlIGRvY3MgcmlnaHQgbm93LCB0aGV5IGp1c3QgdGFs
ayBhYm91dCBDUFUgc3VwcG9ydCAoSU1PIHdlIGNvdWxkIAo+IHByb2JlIHRoYXQgd2l0aCBhIHRy
YXAsIGJ1dCBJJ20gZmluZSB3aXRoIHRoZSBEVCBlbnRyeSBhcyBpdCdzIGEgYml0IAo+IHNpbXBs
ZXIpLgo+IAo+PiBXZWkgRnUgKDIpOgo+PiDCoCBkdC1iaW5kaW5nczogcmlzY3Y6IGFkZCBtbXUt
c3VwcG9ydHMtc3ZwYm10IGZvciBTdnBibXQKPj4gwqAgcmlzY3Y6IGFkZCBSSVNDLVYgU3ZwYm10
IGV4dGVuc2lvbiBzdXBwb3J0cwo+Pgo+PiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbMKgwqDCoMKgwqDCoCB8wqAgNSArKysKPj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL2ZpeG1hcC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5owqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDggKystLQo+PiDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmjCoMKgwqDC
oMKgwqDCoMKgIHwgNDEgKysrKysrKysrKysrKysrKysrLQo+PiDCoGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOSArKysrKysrKysr
KysrKy0tLS0KPj4gwqBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAzMiArKysrKysrKysrKysrKysKPj4gwqBhcmNoL3Jpc2N2L21t
L2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA1ICsrKwo+PiDCoDcgZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDE1IGRl
bGV0aW9ucygtKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
