Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E25C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AscxrGMjp3IOo5+zHyTHy5Ls+n+tCT99dhaYdlVKws=; b=C9s+KmM9Su2z16
	wUqavp/MDz7i+s6V8p7oYZ4WB+HyvOuBC+zPioGcIOeHT3Ynd7ljZDe3Ahfc0Bzz+JIwCQ8qrPzOP
	z6kMBmfdOM1f0RbfmpisbYcwBmPO9URUnuzihF1FBBIDP52m3q1rue//UtHqKMoAPLbDgAM9T7kLn
	lBkUTrkQeo/nMmmJQ2FbNai1MGQcpB6fR6tV7KM1pS1i4FiImN6ypnhv7aZ2d/j7xNODQ+LW1No2F
	L7YjOr1okYcRGClZs+Rha3Q3xdNQWZtsLUznemhRZg+SoRh6KEWwRjOR3wiTBAvkJAJryg5aP/1mY
	yVyVsIrHHEeqizIhjaUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pblJS-006qTm-22; Mon, 13 Mar 2023 16:46:18 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbl1f-006klv-HD
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 16:28:01 +0000
Received: by mail-io1-xd2c.google.com with SMTP id bf15so5232539iob.7
        for <linux-riscv@lists.infradead.org>; Mon, 13 Mar 2023 09:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678724869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uThRQ+LYc3DxfsAWXC/vPY+ugCmlfaobHQqFrI5rVyg=;
        b=NFGoQpB+8ib1in+s3af9+VB5yHzj2lDnrovQryBfGVP20pUWWtnKKxx44SWm1H9AKa
         fEDpW3umOBDmokjGyYFPMY5BCFp92bfWs9M5XPbAkjg3dQMYeebXkgWZ4YZOwzZU34Uq
         ok+LIfx2YxHbOVRr4Lg5ISUDFzCc58eW8u4G7UuO5J6aNofv8fx1XC+J51YUq1TbQIvX
         E1mhWadnuPOyqhspB8PwpTnW8oqazvPkAH8Mx59d17OBalBwPA9slh5bIKSSLe6IsrwJ
         +d80Q1hJFaYV6W4g97QxWuUh/86LlP+XbWsBmme0M3UXaMvB3abypA4/PHpV6eShNfV6
         aCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678724869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uThRQ+LYc3DxfsAWXC/vPY+ugCmlfaobHQqFrI5rVyg=;
        b=Abo1q3UO79PlZda7F9d+kM+92yew26r18hI6nfv/j2xg2C1YdbxU6/yod94NLLyC2P
         JFQro0JWbj1YPlztontWPimiZHGtjyEkoKXbRMqPEKgDRa8eWWBaj0F87WQUFde3B5k2
         rq1zu8qPaJEKhaEpjZA7gzUPqN5ufe7O/QGjqidGsRNWuMQRdbqtXK3pKo4v5LVDIsI4
         2mx7ZLJqFzDLUhD77Frd1KrxHvOX3XJVxFuGXEYtWONONhy6pYgU90Yk+bVMtfwddiLG
         NjRVgj1O2UlNU+XyFTqKtN3/fC4PC1FGzTBxHe+MZjGIQzM25oHA657lSbgvrSNF+BQD
         rO8A==
X-Gm-Message-State: AO0yUKV1dcGmnPk4vVVnzcu5/LkTb4YcA7S54DKcj8rQJDvI+zOGF8kb
	7UuxPv8CgzmUa63XGiqkZLOkaCVcvYf+Yz+1CbB3/A==
X-Google-Smtp-Source: AK7set+7EtFwe6HXEKJ1Gf+hvJUXct2FYTqYMvd+TWTbl75XQSf6BtdH8inJGp4bsSLQOwWWrvIZaQr2rvAzxm9CdDw=
X-Received: by 2002:a5d:8b47:0:b0:745:c41a:8f0f with SMTP id
 c7-20020a5d8b47000000b00745c41a8f0fmr16695129iot.2.1678724867424; Mon, 13 Mar
 2023 09:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230311112122.28894-1-p4ranlee@gmail.com> <CAP-5=fWkAqX+Uy_XhXHjEx6sj-wpOJ+WQf=vMtRzRBS-0Kj32Q@mail.gmail.com>
 <09d44d74-f3c9-cf99-8d14-74499485e956@gmail.com>
In-Reply-To: <09d44d74-f3c9-cf99-8d14-74499485e956@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Mar 2023 09:27:35 -0700
Message-ID: <CAP-5=fUqLdCD_Ks2WQxjyRoNO53PxzDv_P7GJuY320+gKF=vEw@mail.gmail.com>
Subject: Re: [PATCH] perf tools riscv: Add support for riscv lookup_binutils_path
To: Paran Lee <p4ranlee@gmail.com>
Cc: Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_092755_679748_D11C7B91 
X-CRM114-Status: GOOD (  35.55  )
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

T24gU3VuLCBNYXIgMTIsIDIwMjMgYXQgNTo1M+KAr0FNIFBhcmFuIExlZSA8cDRyYW5sZWVAZ21h
aWwuY29tPiB3cm90ZToKPgo+Cj4KPiAyMy4gMy4gMTIuIDE1OjI37JeQIElhbiBSb2dlcnMg7J20
KOqwgCkg7JO0IOq4gDoKPiA+IE9uIFNhdCwgTWFyIDExLCAyMDIzIGF0IDM6MjLigK9BTSBwYXJh
bmxlZSA8cDRyYW5sZWVAZ21haWwuY29tPiB3cm90ZToKPiA+Pgo+ID4+IEFkZCB0byBrbm93IFJJ
U0MtViBiaW51dGlscyBwYXRoLgo+ID4+IFNlY29uZGFyaWx5LCBlZGl0IHRoZSBjb2RlIGJsb2Nr
IHdpdGggYWxwaGFiZXRpY2FsIG9yZGVyLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogUGFyYW4g
TGVlIDxwNHJhbmxlZUBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gIHRvb2xzL3BlcmYvYXJjaC9j
b21tb24uYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiA+
PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4+
Cj4gPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3BlcmYvYXJjaC9jb21tb24uYyBiL3Rvb2xzL3BlcmYv
YXJjaC9jb21tb24uYwo+ID4+IGluZGV4IDU5ZGQ4NzVmZDVlNC4uMDU4NTI3ZWRlZGRkIDEwMDY0
NAo+ID4+IC0tLSBhL3Rvb2xzL3BlcmYvYXJjaC9jb21tb24uYwo+ID4+ICsrKyBiL3Rvb2xzL3Bl
cmYvYXJjaC9jb21tb24uYwo+ID4+IEBAIC0yOSwxMSArMjksMjMgQEAgY29uc3QgY2hhciAqY29u
c3QgYXJtX3RyaXBsZXRzW10gPSB7Cj4gPj4gIH07Cj4gPj4KPiA+PiAgY29uc3QgY2hhciAqY29u
c3QgYXJtNjRfdHJpcGxldHNbXSA9IHsKPiA+PiArICAgICAgICJhYXJjaDY0LXVua25vd24tbGlu
dXgtIiwKPiA+Cj4gPiBNb2RpZnlpbmcgQVJNNjQgYmVoYXZpb3Igc2hvdWxkIGJlIGEgc2VwYXJh
dGUgY2hhbmdlLgo+ID4KPiA+PiAgICAgICAgICJhYXJjaDY0LWxpbnV4LWFuZHJvaWQtIiwKPiA+
PiAgICAgICAgICJhYXJjaDY0LWxpbnV4LWdudS0iLAo+ID4+ICAgICAgICAgTlVMTAo+ID4+ICB9
Owo+ID4+Cj4gPj4gK2NvbnN0IGNoYXIgKmNvbnN0IG1pcHNfdHJpcGxldHNbXSA9IHsKPiA+PiAr
ICAgICAgICJtaXBzLXVua25vd24tbGludXgtZ251LSIsCj4gPj4gKyAgICAgICAibWlwc2VsLWxp
bnV4LWFuZHJvaWQtIiwKPiA+PiArICAgICAgICJtaXBzLWxpbnV4LWdudS0iLAo+ID4+ICsgICAg
ICAgIm1pcHM2NC1saW51eC1nbnUtIiwKPiA+PiArICAgICAgICJtaXBzNjRlbC1saW51eC1nbnVh
Ymk2NC0iLAo+ID4+ICsgICAgICAgIm1pcHM2NC1saW51eC1nbnVhYmk2NC0iLAo+ID4+ICsgICAg
ICAgIm1pcHNlbC1saW51eC1nbnUtIiwKPiA+PiArICAgICAgIE5VTEwKPiA+PiArfTsKPiA+PiAr
Cj4gPgo+ID4gVGhpcyB3aWxsIGFmZmVjdCB0aGUgYmxhbWUgaGlzdG9yeS4gSXQgc2hvdWxkIHBy
b2JhYmx5IGJlIGl0cyBvd24gY2hhbmdlIHRvby4KPgo+IFRoYW5rIHlvdSBmb3IgcmV2aWV3ISBJ
IGFncmVlLiBTbyBJIHdvdWxkIHNwbGl0IHRoZSBwYXRjaC4KPgo+ID4+IC0KPiA+PiAgc3RhdGlj
IGJvb2wgbG9va3VwX3BhdGgoY2hhciAqbmFtZSkKPiA+PiAgewo+ID4+ICAgICAgICAgYm9vbCBm
b3VuZCA9IGZhbHNlOwo+ID4+IEBAIC0xNjQsMTggKzE3OSwyMiBAQCBzdGF0aWMgaW50IHBlcmZf
ZW52X19sb29rdXBfYmludXRpbHNfcGF0aChzdHJ1Y3QgcGVyZl9lbnYgKmVudiwKPiA+PiAgICAg
ICAgICAgICAgICAgcGF0aF9saXN0ID0gYXJtX3RyaXBsZXRzOwo+ID4+ICAgICAgICAgZWxzZSBp
ZiAoIXN0cmNtcChhcmNoLCAiYXJtNjQiKSkKPiA+PiAgICAgICAgICAgICAgICAgcGF0aF9saXN0
ID0gYXJtNjRfdHJpcGxldHM7Cj4gPj4gKyAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJt
aXBzIikpCj4gPj4gKyAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IG1pcHNfdHJpcGxldHM7Cj4g
Pj4gICAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJwb3dlcnBjIikpCj4gPj4gICAgICAg
ICAgICAgICAgIHBhdGhfbGlzdCA9IHBvd2VycGNfdHJpcGxldHM7Cj4gPj4gLSAgICAgICBlbHNl
IGlmICghc3RyY21wKGFyY2gsICJzaCIpKQo+ID4+IC0gICAgICAgICAgICAgICBwYXRoX2xpc3Qg
PSBzaF90cmlwbGV0czsKPiA+PiArICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInJpc2N2
MzIiKSkKPiA+PiArICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gcmlzY3YzMl90cmlwbGV0czsK
PiA+PiArICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInJpc2N2NjQiKSkKPiA+PiArICAg
ICAgICAgICAgICAgcGF0aF9saXN0ID0gcmlzY3Y2NF90cmlwbGV0czsKPiA+PiAgICAgICAgIGVs
c2UgaWYgKCFzdHJjbXAoYXJjaCwgInMzOTAiKSkKPiA+PiAtICAgICAgICAgICAgICAgcGF0aF9s
aXN0ID0gczM5MF90cmlwbGV0czsKPiA+PiArICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gczM5
MF90cmlwbGV0czsKPiA+Cj4gPiB3aGl0ZXNwYWNlIGlzc3VlPwo+Cj4gSSB0cmllZCB0byBjb3Jy
ZWN0IHRoZSBhbHBoYWJldGljYWwgb3JkZXIgYmVjYXVzZSBpdCB3YXMgdmFndWVseSBzb3J0ZWQu
Cj4gQW5kIEknbGwgdHJ5IHRvIHdvcmsgb24gYmxhbWUgaGlzdG9yeSBvbiBlYWNoIGFyY2ggY29k
ZSBibG9jayBhcyB3ZWxsLgo+Cj4gPj4gKyAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJz
aCIpKQo+ID4+ICsgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBzaF90cmlwbGV0czsKPiA+PiAg
ICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInNwYXJjIikpCj4gPj4gICAgICAgICAgICAg
ICAgIHBhdGhfbGlzdCA9IHNwYXJjX3RyaXBsZXRzOwo+ID4+ICAgICAgICAgZWxzZSBpZiAoIXN0
cmNtcChhcmNoLCAieDg2IikpCj4gPj4gICAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IHg4Nl90
cmlwbGV0czsKPiA+PiAtICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgIm1pcHMiKSkKPiA+
PiAtICAgICAgICAgICAgICAgcGF0aF9saXN0ID0gbWlwc190cmlwbGV0czsKPiA+PiAgICAgICAg
IGVsc2Ugewo+ID4+ICAgICAgICAgICAgICAgICB1aV9fZXJyb3IoImJpbnV0aWxzIGZvciAlcyBu
b3Qgc3VwcG9ydGVkLlxuIiwgYXJjaCk7Cj4gPj4gICAgICAgICAgICAgICAgIGdvdG8gb3V0X2Vy
cm9yOwo+ID4KPiA+IEkgdGhpbmsgaW4gZ2VuZXJhbCB3ZSBuZWVkIHRvIHJldmFtcCB0aGlzIGNv
ZGUuIFR3byB0aGluZ3MgdGhhdCBJIHNlZQo+ID4gdGhhdCBhcmUgbWlzc2luZyBhcmUgKDEpIHN1
cHBvcnQgZm9yIHBlcmYgY29uZmlnIGFuZCAoMikgYWRkcjJsaW5lCj4gPiBzaG91bGQgYmUgY29u
ZmlndXJhYmxlLCB5b3UgbWF5IHdhbnQgbGx2bS1hZGRyMmxpbmUuIEFkZGluZyBSSVNDLVYgaXMK
PiA+IG9mIGNvdXJzZSBpbXBvcnRhbnQgdG9vIDotKQo+ID4KPiA+IFRoYW5rcywKPiA+IElhbgo+
Cj4gTWF5IEkgYXNrIGRvY3VtZW50YXRpb24gb3IgaGludCB0aGF0IEkgY2FuIGhlbHAgd29yayB3
aXRoPwo+Cj4gUC5TLgo+Cj4gSSdtIGludGVyZXN0ZWQgaW4gdGhlIEdvb2dsZSBTdW1tZXIgT2Yg
Y29kZSBwZXJmIGNhdGVnb3J5IHRoaXMgeWVhciwKPiBlc3BlY2lhbGx5IHRoZSBwYXJ0IGFib3V0
IHJpc2MtdiBhcmNoaXRlY3R1cmUsIEkgcmVjZW50bHkgcHVyY2hhc2VkIGEKPiBkZXZlbG9wbWVu
dCBib2FyZCBhbmQgd291bGQgbGlrZSB0byBiZSBhYmxlIHRvIHRlc3QgcGVyZiBvbiBhIFNpZml2
ZSBVNzQKPiBDUFUgYmFzZWQgZW52aXJvbm1lbnQuCj4gQnV0IEkndmUgb25seSB1c2VkIHBlcmYg
d2l0aCBjb21tYW5kIHRvb2wgYW5kIGRvbid0IGtub3cgbXVjaCBhYm91dCB0aGUKPiBpbnRlcm5h
bHMsIHNvIGlmIHRoZXJlIGlzIGEgcm9hZG1hcCBmb3IgcGVyZiBkZXZlbG9wbWVudCBvcgo+IGNv
bnRyaWJ1dGlvbiwgSSBoYXZlIGludGVyZXN0IGluIHBlcmYgaW50ZXJuYWxzIGJvdGgga2VybmVs
IGFuZCB1c2VyIHNpZGUuCj4gTWF5IEkgYXNrIGluZm9ybWF0aW9uIHRvIGFwcGx5Pwo+IEkgYW0g
ZGV2ZWxvcGluZyBMaW51eCBTZWN1cml0eSBEcml2ZXIgZHJpdmVycyBmb3IgYSBzZWN1cml0eSBj
b21wYW55Lgo+Cj4gQlIKPiBQYXJhbiBMZWUKCkhpIFBhcmFuLAoKVGhhbmtzIGZvciBiZWluZyBp
bnRlcmVzdGVkIGluIEdTb0Mgd2l0aCBMaW51eCBwZXJmLiBIZXJlIGlzIHdoYXQgSQpwb3N0ZWQg
b24gdGhlIG1haWxpbmcgbGlzdDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11
c2Vycy9DQVAtNT1mV3hGNmluNHZReUd1aD0wa3BBWUVYQVlaTl9Lb2JYQ1k9VFgyb3hzc1orSFFA
bWFpbC5nbWFpbC5jb20vCkFwcGxpY2F0aW9ucyBhcmUgdWx0aW1hdGVseSBzZW50IHRvOgpodHRw
czovL3N1bW1lcm9mY29kZS53aXRoZ29vZ2xlLmNvbS8KYW5kIHRoZSBlbnRyeSByZXF1aXJlbWVu
dHMgYXJlIHRoZXJlLiBJIGJlbGlldmUgdGhleSBhcmUgbGVzcyBzdHJpY3QKdGhhbiBwcmV2aW91
c2x5LgoKV3J0IHRoZSBwYXRjaCwgY291bGQgeW91IHJlcGx5IHRvIENvbm9yJ3MgcmVzcG9uc2Uu
CgpUaGFua3MsCklhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
