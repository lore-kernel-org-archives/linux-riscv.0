Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24AFCD8C81
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 16:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqr1MMwdu0t1jklgm/wPLONEqHHm0k2e4E7jFDtdq5w=; b=CoGGDWz3nPElPm
	Gb7XU4NjSr90wlc6wDvEGvrxES84jUhO21Fb+RZpLV2vSjt7SKeDdl7bZeA5jnia+CRthBUohqPvA
	Kz58rI5wQmeWNTdLQ0/PifwWpQqIMsnu/UlUIKD+SJ3uRboWFdYHexUhV/1avux4K+yIXH4pnla+v
	/pNedAfXTqi73BMdZJYRG9C88jcLtSponw3knqanzg7jTPdx6t76VTiSvvPsTm6SZOPYDF5h9WVEO
	ONuk2/7ohMZmdZjgvO17DFk3TOpwThvi82IqxpcQyyzpLjRMpMmWaELgTIoDw3XgO7PIgY/xPdgNs
	lnHJ9UB41fht65WKW6Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXBi-00000000tb6-07Cs;
	Fri, 05 Jun 2026 16:14:26 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXBe-00000000tZm-16Qg
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 16:14:24 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-69e402b625fso1435958eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 09:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676061; cv=none;
        d=google.com; s=arc-20240605;
        b=JSE9LBcxBxJCc10zfUfncW5PDVtkZtSZ+lcNne5wuPGEKaL+OKFz5UNuxnNNWKFPpC
         FDBS/DnXZcPxRBFEYVDqonHmAV8oZ9kIVZfvZ/JyXHEu0Vtxl4uHWvIMa0a4EC53imXy
         5Vi5N+a7kT/FWAxnsUwQnaRyJ1nIUCR5v3BLbLjWrZPJlOKTgBLGVMK0izJNwuBXyQJF
         Wih2EkHmSzQqoOViggLrHrMOToKwETexh/D6AQO71fCU6k1vIUF3frgyp3Mglnuk373e
         feC/MgxB3c1YiMgZu7JQ9rUrRaRc3zatWX3lqYqS9U2nVpsuyulKglFAFpCDVe/zzCzz
         cOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7NtIoBpAV8Yt8sLUxmMCGh/qfsofFoAAgy815UWWYi4=;
        fh=N0siOkWKEVtLvB1/tp5sc1LJppLEUEwggmvEiuR34k4=;
        b=TheEEp+CwxrqFePOJJX/kWej/PQFnRgRIC+PP4Cdv61Edu9Nn61EMfnAeHy00outk2
         uQ2oUl2OOGR194+drp96JkRkrw7Em2VlDl2Nqd6OeXgUdH3Bqj5mt4Y7/OXP9W55dR/8
         oTd7HH2DXa9sp64CFkO7u62V1AUCOAtsWqJnhimd6h3cau/c2D+bHTK929WsYxxYQoG+
         yCWIJplj7RTfbDugAisZGOYd7IlnsvCTSnpElE9nzFJLU1fupcYsSDTZfL1gNTITxnOH
         qMpDJtux45nwfDz1BTJbdkY1ONMopGz1LxYFRPiBYsvuwf+8xSY53QtwlHIideNYD1pa
         Kotw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780676061; x=1781280861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NtIoBpAV8Yt8sLUxmMCGh/qfsofFoAAgy815UWWYi4=;
        b=RVa2HsJ6P4fLSZtV04SeIoO0Apj+t2BEyqHAfvRnnbQkuA/xhQleWSLYTuRdRq0iy3
         ZCufYkNt9V6MWlF90SrA7uQyyMCI8/ZlpFy7w3Fg33HEYYyKebnR8Wok3/oFkKUh7XB3
         KddUkMGVN7veCcRyfLJx766PS7EbMjiqagoDeYJe1/u532v3n7BLEBC+z7yHgJ4XUGHA
         ydbPjAZMX/oo/jqt4RNPCGItQiKJ8j900fOqktjrSlwfZxtnvrTsEbBXHpPW4qMNyy4I
         Tinv7vA5XXFIZuED6/28arGQC7ZXxPsiLJ9uOdZRbw4ubJNHnKyFx11yBiVFlnsisD9Y
         jHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676061; x=1781280861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NtIoBpAV8Yt8sLUxmMCGh/qfsofFoAAgy815UWWYi4=;
        b=SOaYqpa3peW0whEOyggaJeUhx86hC+ypC/Xm9BMmrHNXmdtI8ltV4LvhfC12Sx62G+
         tlBsGglLwLa53MOnV3ox4eOd6MfXhqX3aHthyFsvlCoNP7JzDXlwYgbUivQ960Nu9IHG
         OwO2lK80D0/ILc6yA5ryhofF61/DLsDMNA6/pQiSRMqY9R/InsM5aLelsYWMhQo86mw8
         Kgga1byQRBseHyXuWe4k53CM/0vHNCVuuOlV8vRy0iVCELwFdlZX2EKtKCLiiokx+NnE
         lqlNgQN3RuGFDiWQyPu2tkN9A0XN+wP3yRI97VLjgqFRhbS5X5fg0YJlNPA0g9NqybqO
         Fcpg==
X-Forwarded-Encrypted: i=1; AFNElJ+Q0Fr2e47ltUnplNIXOEBrSGk5Pl3isdDYS3vtEhMgwHbf6dKSdTeVo/087ohkFOhuNa9pRV7LMTqGnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKolSDM6GNc0AhVv80hwegJkzrc2Vw9SjOSV28BVfyW0PgchYq
	Zzsfaeu8VbyGDmAreylD2CKwe6a4bTj9iKmbtdyU4wB28vDk67x4xC/XR1ecXvrldykw0hrZRZS
	p9q60eCDMfRq/CoZo3qcO380cjPCh5ylStnZJc3mmEQ==
X-Gm-Gg: Acq92OF068JJ7bVwtC7NX172CThrGY2A2r5CvMeM5XaDc4S9hULGLFN+1qlKxy9tBvM
	Iq2Lfi4FR34TlgJsYvvdbE5itWzhwGe7TD8RpR95SPHH9rQACuwaIHFQe67x2fs05CrbWJOHdxx
	LSAsyi7wBy4pVOVio9WgYNvzEkYYdzWyb/CQKwSGnc4xeHgIRY4dkA1CqcEIW4ZvTuSW+Z8EKDS
	pnX9nRESQ3NW9qGowqyvZQXohlbH83/4ZJ4EGsFq6LsJiNXmXrGxncOqnZ4/XKBOPIXRWSb+j5M
	2A8ojtUVBr1AJfAo/lDPvC6QWVXpkLLI6hFxDnWCUwsH9wbnudc3RVvbbPH3pt563FFq0KpG/UZ
	MHWvY6IRrwSgcaoUdzLr+vONhZLUH6Yx1PRNP
X-Received: by 2002:a05:6820:188f:b0:69d:9288:66c8 with SMTP id
 006d021491bc7-69e68b41cc5mr2597061eaf.13.1780676061024; Fri, 05 Jun 2026
 09:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-5-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-5-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:44:08 +0530
X-Gm-Features: AVVi8Ce62RKsSjJXp-wBAJPsFgxeGW_0U3nJg8KcNtHwU-Je7pjwoDXpaiVHSug
Message-ID: <CAAhSdy2oeV=XjQp8YQ9iMwHVQ8B3HDmmUbhmbbYjRLvbp6daow@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] KVM: riscv: selftests: Split SBI FWFT into
 separate feature-specific sublists
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_091422_320899_A3F551D9 
X-CRM114-Status: GOOD (  24.63  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBEaXZpZGUgdGhlIG1vbm9saXRoaWMgU0JJIEZX
RlQgKEZpcm13YXJlIEZlYXR1cmVzKSByZWdpc3RlciBsaXN0IGludG8KPiBzZXBhcmF0ZSBzdWJs
aXN0cywgZWFjaCB0ZXN0aW5nIGEgc3BlY2lmaWMgRldGVCBmZWF0dXJlIGluZGVwZW5kZW50bHkK
PiB3aXRoIHByb3BlciBkZXBlbmRlbmN5IGNoZWNraW5nLgo+Cj4gUHJldmlvdXNseSwgYWxsIEZX
RlQgZmVhdHVyZXMgd2VyZSB0ZXN0ZWQgdG9nZXRoZXIgaW4gYSBzaW5nbGUgc3VibGlzdC4KPiBU
aGlzIGNhdXNlZCBpc3N1ZXMgYmVjYXVzZToKPiAxLiBOb3QgYWxsIEZXRlQgZmVhdHVyZXMgYXJl
IGF2YWlsYWJsZSBvbiBhbGwgcGxhdGZvcm1zCj4gMi4gU29tZSBmZWF0dXJlcyBkZXBlbmQgb24g
c3BlY2lmaWMgSVNBIGV4dGVuc2lvbnMgKGUuZy4sIHBvaW50ZXJfbWFza2luZwo+IHJlcXVpcmVz
IFNtbnBtKQo+IDMuIFRlc3RzIHdvdWxkIGZhaWwgaWYgYW55IHNpbmdsZSBmZWF0dXJlIHdhcyB1
bmF2YWlsYWJsZQo+Cj4gQWRkIHRoZSBmZWF0dXJlLXNwZWNpZmljIFNCSSBGV0ZUIHN1Ymxpc3Rz
IHdpdGggdGhlIGZvbGxvd2luZwo+IGltcHJvdmVtZW50czoKPiAtIEFkZCBjaGVja19md2Z0X2Zl
YXR1cmUoKSBoZWxwZXIgdG8gdmVyaWZ5IEZXRlQgZmVhdHVyZSBhdmFpbGFiaWxpdHkKPiAgIGF0
IHJ1bnRpbWUKPiAtIFVwZGF0ZSBmaWx0ZXJfcmVnKCkgdG8gaGFuZGxlIHBlci1mZWF0dXJlIEZX
RlQgcmVnaXN0ZXIgZmlsdGVyaW5nCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8
eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCA2MCArKysrKysrKysrKysr
KysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDU3IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2
L2dldC1yZWctbGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1y
ZWctbGlzdC5jCj4gaW5kZXggNTAzM2MwOTIwMWVmLi5jYjg2Y2I2YjM2MzUgMTAwNjQ0Cj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gKysr
IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gQEAg
LTI3LDYgKzI3LDcgQEAgZW51bSB7Cj4gIH07Cj4KPiAgc3RhdGljIGJvb2wgaXNhX2V4dF9jYW50
X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfTUFYXTsKPiArc3RhdGljIGJvb2wgc2JpX2V4dF9l
bmFibGVkW0tWTV9SSVNDVl9TQklfRVhUX01BWF07Cj4KPiAgYm9vbCBmaWx0ZXJfcmVnKF9fdTY0
IHJlZykKPiAgewo+IEBAIC0xNDksNiArMTUwLDE0IEBAIGJvb2wgZmlsdGVyX3JlZyhfX3U2NCBy
ZWcpCj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ1NSIHwgS1ZNX1JFR19SSVNDVl9DU1Jf
QUlBIHwgS1ZNX1JFR19SSVNDVl9DU1JfQUlBX1JFRyhpcHJpbzFoKToKPiAgICAgICAgIGNhc2Ug
S1ZNX1JFR19SSVNDVl9DU1IgfCBLVk1fUkVHX1JJU0NWX0NTUl9BSUEgfCBLVk1fUkVHX1JJU0NW
X0NTUl9BSUFfUkVHKGlwcmlvMmgpOgo+ICAgICAgICAgICAgICAgICByZXR1cm4gaXNhX2V4dF9j
YW50X2Rpc2FibGVbS1ZNX1JJU0NWX0lTQV9FWFRfU1NBSUFdOwo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIEZXRlQgbWlzYWxpZ25lZCBkZWxlZ2F0aW9uIHJlZ2lzdGVycyBhcmUgYWx3YXlzIHZp
c2libGUgd2hlbiB0aGUgU0JJIEZXRlQKPiArICAgICAgICAqIGV4dGVuc2lvbiBpcyBlbmFibGUg
YW5kIHRoZSBob3N0IHN1cHBvcnRzIHRoZSBtaXNhbGlnbmVkIGRlbGVnYXRpb24uCj4gKyAgICAg
ICAgKi8KPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgfCBLVk1fUkVHX1JJ
U0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9SRUcobWlzYWxpZ25lZF9kZWxl
Zy5lbmFibGUpOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX1NCSV9TVEFURSB8IEtWTV9S
RUdfUklTQ1ZfU0JJX0ZXRlQgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUX1JFRyhtaXNhbGlnbmVk
X2RlbGVnLmZsYWdzKToKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgfCBL
Vk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9SRUcobWlzYWxp
Z25lZF9kZWxlZy52YWx1ZSk6Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBzYmlfZXh0X2VuYWJs
ZWRbS1ZNX1JJU0NWX1NCSV9FWFRfRldGVF07Cj4gICAgICAgICBkZWZhdWx0Ogo+ICAgICAgICAg
ICAgICAgICBicmVhazsKPiAgICAgICAgIH0KPiBAQCAtMTkzLDYgKzIwMiwyNyBAQCBzdGF0aWMg
aW50IG92ZXJyaWRlX3ZlY3Rvcl9yZWdfc2l6ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVj
dCB2Y3B1X3JlZ19zdWJsaQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICt2b2lkIGNoZWNr
X2Z3ZnRfZmVhdHVyZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19zdWJs
aXN0ICpzLCB1NjQgZmVhdHVyZSkKPiArewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyB2YWx1ZTsK
PiArICAgICAgIGludCByYzsKPiArCj4gKyAgICAgICAvKiBFbmFibGUgU0JJIEZXRlQgZXh0ZW5z
aW9uIHNvIHRoYXQgd2UgY2FuIGNoZWNrIHRoZSBzdXBwb3J0ZWQgcmVnaXN0ZXIgKi8KPiArICAg
ICAgIHJjID0gX192Y3B1X3NldF9yZWcodmNwdSwgZmVhdHVyZSwgMSk7Cj4gKyAgICAgICBpZiAo
cmMpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBmb3IgKGludCBpID0g
MDsgaSA8IHMtPnJlZ3NfbjsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmICgocy0+cmVnc1tp
XSAmIEtWTV9SRUdfUklTQ1ZfVFlQRV9NQVNLKSA9PSBLVk1fUkVHX1JJU0NWX1NCSV9TVEFURSkg
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJjID0gX192Y3B1X2dldF9yZWcodmNwdSwgcy0+
cmVnc1tpXSwgJnZhbHVlKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBfX1RFU1RfUkVRVUlS
RSghcmMsICIlcyBub3QgYXZhaWxhYmxlLCBza2lwcGluZyB0ZXN0cyIsIHMtPm5hbWUpOwo+ICsg
ICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgLyogV2Ugc2hvdWxkIGFz
c2VydCBpZiBkaXNhYmxpbmcgZmFpbGVkIGhlcmUgd2hpbGUgZW5hYmxpbmcgc3VjY2VlZGVkIGJl
Zm9yZSAqLwo+ICsgICAgICAgdmNwdV9zZXRfcmVnKHZjcHUsIGZlYXR1cmUsIDApOwo+ICt9Cj4g
Kwo+ICB2b2lkIGZpbmFsaXplX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgdmNw
dV9yZWdfbGlzdCAqYykKPiAgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBpc2FfZXh0X3N0YXRl
W0tWTV9SSVNDVl9JU0FfRVhUX01BWF0gPSB7IDAgfTsKPiBAQCAtMjM1LDYgKzI2NSw5IEBAIHZv
aWQgZmluYWxpemVfdmNwdShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCB2Y3B1X3JlZ19s
aXN0ICpjKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAg
ICBjYXNlIFZDUFVfRkVBVFVSRV9TQklfRVhUOgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGZl
YXR1cmUgPSBSSVNDVl9TQklfRVhUX1JFRyhzLT5mZWF0dXJlKTsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBpZiAocy0+ZmVhdHVyZSA9PSBLVk1fUklTQ1ZfU0JJX0VYVF9GV0ZUKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hlY2tfZndmdF9mZWF0dXJlKHZjcHUsIHMsIGZl
YXR1cmUpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9leHRfZW5hYmxlZFtzLT5mZWF0
dXJlXSA9IHRydWU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAg
ICAgICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgICAgICAgICAgVEVTVF9GQUlMKCJVbmtu
b3duIGZlYXR1cmUgdHlwZSIpOwo+IEBAIC04OTcsMTEgKzkzMCwxNSBAQCBzdGF0aWMgX191NjQg
c2JpX3N0YV9yZWdzW10gPSB7Cj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpF
X1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgfCBLVk1fUkVHX1JJU0NWX1NCSV9TVEEg
fCBLVk1fUkVHX1JJU0NWX1NCSV9TVEFfUkVHKHNobWVtX2hpKSwKPiAgfTsKPgo+IC1zdGF0aWMg
X191NjQgc2JpX2Z3ZnRfcmVnc1tdID0gewo+ICtzdGF0aWMgX191NjQgc2JpX2Z3ZnRfbWlzYWxp
Z25lZF9kZWxlZ19yZWdzW10gPSB7Cj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19T
SVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfRVhUIHwgS1ZNX1JFR19SSVNDVl9TQklfU0lO
R0xFIHwgS1ZNX1JJU0NWX1NCSV9FWFRfRldGVCwKPiAgICAgICAgIEtWTV9SRUdfUklTQ1YgfCBL
Vk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX1NCSV9TVEFURSB8IEtWTV9SRUdfUklT
Q1ZfU0JJX0ZXRlQgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUX1JFRyhtaXNhbGlnbmVkX2RlbGVn
LmVuYWJsZSksCj4gICAgICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwg
S1ZNX1JFR19SSVNDVl9TQklfU1RBVEUgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JF
R19SSVNDVl9TQklfRldGVF9SRUcobWlzYWxpZ25lZF9kZWxlZy5mbGFncyksCj4gICAgICAgICBL
Vk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9TQklfU1RB
VEUgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVF9SRUco
bWlzYWxpZ25lZF9kZWxlZy52YWx1ZSksCj4gK307Cj4gKwo+ICtzdGF0aWMgX191NjQgc2JpX2Z3
ZnRfcG9pbnRlcl9tYXNraW5nX3JlZ3NbXSA9IHsKPiArICAgICAgIEtWTV9SRUdfUklTQ1YgfCBL
Vk1fUkVHX1NJWkVfVUxPTkcgfCBLVk1fUkVHX1JJU0NWX1NCSV9FWFQgfCBLVk1fUkVHX1JJU0NW
X1NCSV9TSU5HTEUgfCBLVk1fUklTQ1ZfU0JJX0VYVF9GV0ZULAo+ICAgICAgICAgS1ZNX1JFR19S
SVNDViB8IEtWTV9SRUdfU0laRV9VTE9ORyB8IEtWTV9SRUdfUklTQ1ZfU0JJX1NUQVRFIHwgS1ZN
X1JFR19SSVNDVl9TQklfRldGVCB8IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlRfUkVHKHBvaW50ZXJf
bWFza2luZy5lbmFibGUpLAo+ICAgICAgICAgS1ZNX1JFR19SSVNDViB8IEtWTV9SRUdfU0laRV9V
TE9ORyB8IEtWTV9SRUdfUklTQ1ZfU0JJX1NUQVRFIHwgS1ZNX1JFR19SSVNDVl9TQklfRldGVCB8
IEtWTV9SRUdfUklTQ1ZfU0JJX0ZXRlRfUkVHKHBvaW50ZXJfbWFza2luZy5mbGFncyksCj4gICAg
ICAgICBLVk1fUkVHX1JJU0NWIHwgS1ZNX1JFR19TSVpFX1VMT05HIHwgS1ZNX1JFR19SSVNDVl9T
QklfU1RBVEUgfCBLVk1fUkVHX1JJU0NWX1NCSV9GV0ZUIHwgS1ZNX1JFR19SSVNDVl9TQklfRldG
VF9SRUcocG9pbnRlcl9tYXNraW5nLnZhbHVlKSwKPiBAQCAtMTEyOSw3ICsxMTY2LDYgQEAgS1ZN
X1NCSV9FWFRfU0lNUExFX0NPTkZJRyhwbXUsIFBNVSk7Cj4gIEtWTV9TQklfRVhUX1NJTVBMRV9D
T05GSUcoZGJjbiwgREJDTik7Cj4gIEtWTV9TQklfRVhUX1NJTVBMRV9DT05GSUcoc3VzcCwgU1VT
UCk7Cj4gIEtWTV9TQklfRVhUX1NJTVBMRV9DT05GSUcobXB4eSwgTVBYWSk7Cj4gLUtWTV9TQklf
RVhUX1NVQkxJU1RfQ09ORklHKGZ3ZnQsIEZXRlQpOwo+Cj4gIEtWTV9JU0FfRVhUX1NVQkxJU1Rf
Q09ORklHKGFpYSwgU1NBSUEpOwo+ICBLVk1fSVNBX0VYVF9TVUJMSVNUX0NPTkZJRyhmcF9mLCBG
KTsKPiBAQCAtMTIwNiw2ICsxMjQyLDIzIEBAIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoenZr
c2VkLCBaVktTRUQpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHp2a3NoLCBaVktTSCk7
Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoenZrdCwgWlZLVCk7Cj4KPiArc3RhdGljIHN0
cnVjdCB2Y3B1X3JlZ19saXN0IGNvbmZpZ19zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnID0gewo+
ICsgICAgICAgLnN1Ymxpc3RzID0gewo+ICsgICAgICAgICAgICAgICBTVUJMSVNUX0JBU0UsCj4g
KyAgICAgICAgICAgICAgIFNVQkxJU1RfU0JJKGZ3ZnRfbWlzYWxpZ25lZF9kZWxlZywgRldGVCks
Cj4gKyAgICAgICAgICAgICAgIHswfSwKPiArICAgICAgIH0sCj4gK307Cj4gKwo+ICtzdGF0aWMg
c3RydWN0IHZjcHVfcmVnX2xpc3QgY29uZmlnX3NiaV9md2Z0X3BvaW50ZXJfbWFza2luZyA9IHsK
PiArICAgICAgIC5zdWJsaXN0cyA9IHsKPiArICAgICAgICAgICAgICAgU1VCTElTVF9CQVNFLAo+
ICsgICAgICAgICAgICAgICBTVUJMSVNUX0lTQShzbW5wbSwgU01OUE0pLAo+ICsgICAgICAgICAg
ICAgICBTVUJMSVNUX1NCSShmd2Z0X3BvaW50ZXJfbWFza2luZywgRldGVCksCj4gKyAgICAgICAg
ICAgICAgIHswfSwKPiArICAgICAgIH0sCj4gK307Cj4gKwo+ICBzdHJ1Y3QgdmNwdV9yZWdfbGlz
dCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3NiaV9iYXNlLAo+ICAgICAg
ICAgJmNvbmZpZ19zYmlfc3RhLAo+IEBAIC0xMjEzLDcgKzEyNjYsOCBAQCBzdHJ1Y3QgdmNwdV9y
ZWdfbGlzdCAqdmNwdV9jb25maWdzW10gPSB7Cj4gICAgICAgICAmY29uZmlnX3NiaV9kYmNuLAo+
ICAgICAgICAgJmNvbmZpZ19zYmlfc3VzcCwKPiAgICAgICAgICZjb25maWdfc2JpX21weHksCj4g
LSAgICAgICAmY29uZmlnX3NiaV9md2Z0LAo+ICsgICAgICAgJmNvbmZpZ19zYmlfZndmdF9taXNh
bGlnbmVkX2RlbGVnLAo+ICsgICAgICAgJmNvbmZpZ19zYmlfZndmdF9wb2ludGVyX21hc2tpbmcs
Cj4gICAgICAgICAmY29uZmlnX2FpYSwKPiAgICAgICAgICZjb25maWdfZnBfZiwKPiAgICAgICAg
ICZjb25maWdfZnBfZCwKPgo+IC0tCj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
