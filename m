Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE15CED61E
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SE4rh9kl5iZjv3FiePexhzqRfKv+JcOH7/qO6svlTVg=; b=YnAvSe0Lzb/E7A
	xe2VaDQieoHzwJlMKHd8gPaKcjFIQcFGTQzOhaxTMrfQwtB37w30nIAI+WPSR7DdXt3vhwQITXk/u
	VVnimsXpbIrksir7E72PoG2hQJMRc/KZ5+bwOm/XMkHnNd0vDa8MpzfLl/O8gqND8bkfLRvV7gi0Y
	B6kiSCTPwMpvbNFJ/AVq883s+N2f6PfKZdzq0TTMCPmFbCpAS2DLWtrwz0mYCosBjSKsLGD7+Vw7Z
	tZc0j/fRtWz1+svTeGl+DfuH2ndAW+E+MSFAJg03+SBBnrlsScL4ZIO1Mn7aOW6i3IefLgw2yKWdg
	CMO+AGlarQc2ibXinX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syRa3-00000008L3j-0Wui;
	Wed, 09 Oct 2024 07:57:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syRPv-00000008IwX-1Mm2
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 07:47:33 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CF2213F741
	for <linux-riscv@lists.infradead.org>; Wed,  9 Oct 2024 07:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728460047;
	bh=64u7S06vuCARV2d1jETcvXWsb00VtP72rN9+doc72U8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=qSEB6JYwnrPjEMFEmj5Y3lNTuk1ytJW6MYg8GeDc/FDwXRhO+h53JO1ERdjmBK+Oe
	 1HWRNegpBTH+0HrR0u1ohNghqd/SvbpGgKXoxIgnUHsm2qq/gFTCqYlH5+xuK8s5qN
	 cOaP8UF7N6dIe6F5962gDQVSUWrUQtkOBKoF7f9jd/+SNYnWagFcC4qoJn/cK9h2Xa
	 Kod9bqTHZys8KyFl/BaGqD6nNQvXaHv4A2FmvDcxZSrRlePLg9Hg/sYkuut8tRoKMM
	 8J923aKZb80aJ6MkXH5vR2NWbGSN2endcFNxRyCFUD4YNV41jgU92cGIJSl2KO73yd
	 Mfr7lmlJ4zjoQ==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-37d3256c0a2so806130f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 00:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460047; x=1729064847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=64u7S06vuCARV2d1jETcvXWsb00VtP72rN9+doc72U8=;
        b=Gd5v2uc//X+J0OHQgVwiIAyZj/RxUyuV6e7qoaC3c0KJU6j2XrYzfglrkDBc9tpPwY
         BrdjaHZY19hCVckL58nvhHnISjFsyekrAwhcTZs/cehKQRzAXgl0+C6gyMFxnAjdl3UC
         I5Op/67nIM17GcLNoG3FyeLDtXagfSt4K7cUeamI+WRm5PQnboA36KN7QuzKpg1VXmfW
         bFeVohI+DVZyyY/HEBmMnSQfslGJ9SD2yjVG5xCm+qAQiXhbj18KR1+qWOSxQhF4F2qt
         WFcOGh96ojn9BP1KIZT+Gcw7g6214opcqwkRNuwI4I5Kx+4q3idAqJM6ozoBoiqTTlAy
         JdfA==
X-Forwarded-Encrypted: i=1; AJvYcCXw+z3HtoqlVpWqWMomv4NkPSAkBqE1/k7Li7bszDDnIQjnBDgjWPWsCqLxCjARK5c43VgffhVpveAkUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxR8cl2JzV3qsIqQYl9r3xMENTVtkB6Qlk6ZQbDbxiNHthmDxTt
	PugejiZYigKENoirBVJLeQBm0Bt+PFMT5vh98GjJ7/1/6Vu756Spuad+smnxuD1GpcYZgoc/Ojf
	G9DjUYKkY5nLXGSFAQvfrpMqOOuJVTvVNiZMFjbW8l+lVVtArmI97GHtK69u1Omxo/0Vc5bAlcs
	xCgnGc2Q==
X-Received: by 2002:a5d:5e11:0:b0:37d:3bad:a50b with SMTP id ffacd0b85a97d-37d3bada7a8mr652285f8f.45.1728460047170;
        Wed, 09 Oct 2024 00:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjy0iSj86RuRw+Xk9XUJOj0zHUIng80b/tKMspPKiIgG0uuvHQFCiq0VNFpthVXphITx593A==
X-Received: by 2002:a5d:5e11:0:b0:37d:3bad:a50b with SMTP id ffacd0b85a97d-37d3bada7a8mr652267f8f.45.1728460046709;
        Wed, 09 Oct 2024 00:47:26 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:2015:a58c:a3d4:2675:9367? ([2a02:3035:6e0:2015:a58c:a3d4:2675:9367])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf51770sm11658085e9.22.2024.10.09.00.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 00:47:26 -0700 (PDT)
Message-ID: <a3308767-eb30-446b-8c70-32b36a3075e4@canonical.com>
Date: Wed, 9 Oct 2024 09:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] riscv: efi: Set NX compat flag in PE/COFF header
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20240929140233.211800-1-heinrich.schuchardt@canonical.com>
 <3c2ff70d-a580-4bba-b6e2-1b66b0a98c5d@ghiti.fr>
 <811ea10e-3bf1-45a5-a407-c09ec5756b48@canonical.com>
 <2d907c14-5b43-446e-9640-efb0fa0ba385@ghiti.fr>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <2d907c14-5b43-446e-9640-efb0fa0ba385@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_004731_651897_E1BA827E 
X-CRM114-Status: GOOD (  19.48  )
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

T24gMDkuMTAuMjQgMDk6MzQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiBIaSBIZWlucmljaCwK
PiAKPiBPbiAwMS8xMC8yMDI0IDE3OjI0LCBIZWlucmljaCBTY2h1Y2hhcmR0IHdyb3RlOgo+PiBP
biAwMS4xMC4yNCAxNTo1MSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4gSGkgSGVpbnJpY2gs
Cj4+Pgo+Pj4gT24gMjkvMDkvMjAyNCAxNjowMiwgSGVpbnJpY2ggU2NodWNoYXJkdCB3cm90ZToK
Pj4+PiBUaGUgSU1BR0VfRExMQ0hBUkFDVEVSSVNUSUNTX05YX0NPTVBBVCBpbmZvcm1zIHRoZSBm
aXJtd2FyZSB0aGF0IHRoZQo+Pj4+IEVGSSBiaW5hcnkgZG9lcyBub3QgcmVseSBvbiBwYWdlcyB0
aGF0IGFyZSBib3RoIGV4ZWN1dGFibGUgYW5kCj4+Pj4gd3JpdGFibGUuCj4+Pj4KPj4+PiBUaGUg
ZmxhZyBpcyB1c2VkIGJ5IHNvbWUgZGlzdHJvIHZlcnNpb25zIG9mIEdSVUIgdG8gZGVjaWRlIGlm
IHRoZSBFRkkKPj4+PiBiaW5hcnkgbWF5IGJlIGV4ZWN1dGVkLgo+Pj4+Cj4+Pj4gQXMgdGhlIExp
bnV4IGtlcm5lbCBuZWl0aGVyIGhhcyBSV1ggc2VjdGlvbnMgbm9yIG5lZWRzIFJXWCBwYWdlcyBm
b3IKPj4+PiByZWxvY2F0aW9uIHdlIHNob3VsZCBzZXQgdGhlIGZsYWcuCj4+Pj4KPj4+PiBDYzog
QXJkIEJpZXNoZXV2ZWwgPGFyZGJAa2VybmVsLm9yZz4KPj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJp
Y2guc2NodWNoYXJkdEBjYW5vbmljYWwuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGFyY2gvcmlzY3Yv
a2VybmVsL2VmaS1oZWFkZXIuUyB8IDIgKy0KPj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9lZmktaGVhZGVyLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktIAo+Pj4+IGhlYWRl
ci5TCj4+Pj4gaW5kZXggNTE1YjJkZmJjYTc1Li5jNWYxN2MyNzEwYjUgMTAwNjQ0Cj4+Pj4gLS0t
IGEvYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvZWZpLWhlYWRlci5TCj4+Pj4gQEAgLTY0LDcgKzY0LDcgQEAgZXh0cmFfaGVhZGVyX2Zp
ZWxkczoKPj4+PiDCoMKgwqDCoMKgIC5sb25nwqDCoMKgIGVmaV9oZWFkZXJfZW5kIC0gX3N0YXJ0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvLyBTaXplT2ZIZWFkZXJzCj4+Pj4gwqDCoMKgwqDCoCAu
bG9uZ8KgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLy8gQ2hl
Y2tTdW0KPj4+PiDCoMKgwqDCoMKgIC5zaG9ydMKgwqDCoCBJTUFHRV9TVUJTWVNURU1fRUZJX0FQ
UExJQ0FUSU9OwqDCoMKgwqDCoMKgwqAgLy8gU3Vic3lzdGVtCj4+Pj4gLcKgwqDCoCAuc2hvcnTC
oMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIERsbENoYXJh
Y3RlcmlzdGljcwo+Pj4+ICvCoMKgwqAgLnNob3J0wqDCoMKgIElNQUdFX0RMTF9DSEFSQUNURVJJ
U1RJQ1NfTlhfQ09NUEFUwqDCoMKgIC8vIAo+Pj4+IERsbENoYXJhY3RlcmlzdGljcwo+Pj4+IMKg
wqDCoMKgwqAgLnF1YWTCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC8vIFNpemVPZlN0YWNrUmVzZXJ2ZQo+Pj4+IMKgwqDCoMKgwqAgLnF1YWTCoMKgwqAgMMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIFNpemVPZlN0YWNrQ29tbWl0
Cj4+Pj4gwqDCoMKgwqDCoCAucXVhZMKgwqDCoCAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLy8gU2l6ZU9mSGVhcFJlc2VydmUKPj4+Cj4+Pgo+Pj4gSSBkb24ndCB1bmRl
cnN0YW5kIGlmIHRoaXMgZml4ZXMgc29tZXRoaW5nIG9yIG5vdDogd2hhdCBjb3VsZCBnbyAKPj4+
IHdyb25nIGlmIHdlIGRvbid0IGRvIHRoaXM/Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+IEFsZXgK
Pj4+Cj4+Cj4+Cj4+IEhlbGxvIEFsZXhhbmRyZSwKPj4KPj4gaHR0cHM6Ly9sZWFybi5taWNyb3Nv
ZnQuY29tL2VuLXVzL3dpbmRvd3MtaGFyZHdhcmUvZHJpdmVycy9icmluZ3VwLyAKPj4gdWVmaS1j
YS1tZW1vcnktbWl0aWdhdGlvbi1yZXF1aXJlbWVudHMKPj4gZGVzY3JpYmVzIE1pY3Jvc29mdCdz
IGVmZm9ydCB0byBpbXByb3ZlIHNlY3VyaXR5IGJ5IGF2b2lkaW5nIG1lbW9yeSAKPj4gcGFnZXMg
dGhhdCBhcmUgYm90aCBleGVjdXRhYmxlIGFuZCB3cml0YWJsZS4KPj4KPj4gSU1BR0VfRExMX0NI
QVJBQ1RFUklTVElDU19OWF9DT01QQVQgaXMgYW4gYXNzZXJ0aW9uIGJ5IHRoZSBFRkkgYmluYXJ5
IAo+PiB0aGF0IGl0IGRvZXMgbm90IHVzZSBSV1ggcGFnZXMuIEl0IG1heSB1c2UgdGhlIAo+PiBF
RklfTUVNT1JZX0FUVFJJQlVURV9QUk9UT0NPTCB0byBzZXQgd2hldGhlciBhIHBhZ2UgaXMgd3Jp
dGFibGUgb3IgCj4+IGV4ZWN1dGFibGUgKGJ1dCBub3QgYm90aCkuCj4+Cj4+IFdoZW4gdXNpbmcg
c2VjdXJlIGJvb3QsIGNvbXBsaWFudCBmaXJtd2FyZSB3aWxsIG5vdCBhbGxvdyBsb2FkaW5nIGEg
Cj4+IGJpbmFyeSBpZiB0aGUgZmxhZyBpcyBub3Qgc2V0Lgo+IAo+IAo+IEdyZWF0LCBzbyB0aGF0
J3MgYSBuZWNlc3NhcnkgZml4LCBpdCB3aWxsIGdldCBtZXJnZWQgaW4gdGhlIG5leHQgcmMgb3Ig
c286Cj4gCj4gRml4ZXM6IGNiN2QyZGQ1NjEyYSAoIlJJU0MtVjogQWRkIFBFL0NPRkYgaGVhZGVy
IGZvciBFRkkgc3R1YiIpCgpUaGFua3MgZm9yIHJldmlld2luZy4KCkF0IHRoZSB0aW1lIG9mIGNv
bW1pdCBjYjdkMmRkNTYxMmEgKDIwMjAtMTAtMDIpIHRoZSByZXF1aXJlbWVudCBkaWQgbm90IApl
eGlzdC4gSSBndWVzcyBhIEZpeGVzOiB0YWcgaXMgbm90IGFwcGxpY2FibGUgdW5kZXIgdGhlc2Ug
Y2lyY3Vtc3RhbmNlcy4KCkJlc3QgcmVnYXJkcwoKSGVpbnJpY2gKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
