Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9ECC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 22:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Mc/z8BFXhKWGTdNkwuaZxFjsG2iXYrutI7I4QZE6F9g=; b=kkpyhrKHJRGIAx/54mIHX8qG1d
	QuQgn5j/NIg+EzP35GFXHssdTku1FvefAkwg6iqU29XBvdCc6+SeeB1vnppVdbxYR0awXbsiyabbh
	KKrKeDY5S029jQzExNxQQGzokshjhYTdmMBckcDcRH3Dn/o80Me0WwslXfuPtFxeuCUUg1x/V/6GN
	Xlwr6GVK31SJiARjmQ6rLO3qKS8980ffyCcmv6UZ41Fy40xWWJH5rP3OKY/PzLdoinch3d27ZkBCs
	W1ZyYLVQIzvpv4KRdAHVZHbNdhMPZoQ/mFfLBPBg1Vv/4a1LXulBrESoeXkrg4NVwjpMgDCRlwxiR
	G8Yd1CyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEuD-00ACeM-0o;
	Thu, 11 May 2023 22:37:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxEuA-00ACdW-0N
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:37:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-64ac461af60so40473b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683844617; x=1686436617;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmWwc7QUgu9NwZwJ11g/n+7hDdAcXK6mCH8jzITSa+U=;
        b=MSnGXe0qVlt+1QqvhtkQkX6GeAO90qB5sNfEWBfp0SGrlHQsIG7EZ0u0Sx1tirYUyE
         3PIUjTyrTERIte7GLW/YdaHnMGGRN7jYk0Yn+mEVwIkfLixb5qvM9wI2ZaRkFY7qtD1G
         0QgMDzym2GzFZcuRcmKyqHBRLBwaTD8IgdtRwDukUhCzkV9ksE6lX/wtjkNmN/oDq3ms
         4KoLHbSMiEI3SbO+8lkIlztGq1q4dtym3LliushBbn9v+i9X54FQfGYeTsQPfIVULZ+T
         reWZlZ5WG63ItDLL7yGFwu+qXnvFvUlhxAOFEfGp5djdQOFc2A5kE1d5TFQoRGNAxXkl
         axFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683844617; x=1686436617;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmWwc7QUgu9NwZwJ11g/n+7hDdAcXK6mCH8jzITSa+U=;
        b=cvp1pTzOqJAKyeHoTPU4c7kvURxR6XiSNSsb1otyyjh1RiFrPtkmWvSotsNnjd2SUu
         AEJ+dJ8PfQqguP1O/+PryFcEq/tFscys7PIeKIWqQB+a2kyzWUsWBD5UmF738FMwpMco
         iYHl/9czXiE/tjZqRlCUv65y/NXw3DEx4QTkxVmi2jOoADgkhj2B6HszSkPe9Gw9X8IM
         7hei5ykMMX2m1irTQcvVmNkWvEkc2QpvDQauqa0cbxPrYgbUXvD36cDErkmfjbqGsnpH
         fOj+WSH1/MwriW00PhTs26ouKPwlZOOJJMeVmIEp8y3mqr2r8k5H6rHHNrKYVGYjDOxT
         25vw==
X-Gm-Message-State: AC+VfDzR9UE3jzuldoCDFkp4vNtqEePdZgV8kd2x2kMVO72ic1swxuxI
	47tPkQZF8ImF15tRiY56Hmi2pQ==
X-Google-Smtp-Source: ACHHUZ6euXSEFfQsJJHWFvc0KEfHJk2pDpyRjEDRU51GbDCmVTw57xPHdefrpwyUAVHA9et9eIQtPQ==
X-Received: by 2002:a05:6a00:1882:b0:643:b8c2:b577 with SMTP id x2-20020a056a00188200b00643b8c2b577mr29458740pfh.22.1683844616975;
        Thu, 11 May 2023 15:36:56 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c4-20020aa781c4000000b006413bf90e72sm5822096pfn.62.2023.05.11.15.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:36:56 -0700 (PDT)
Date: Thu, 11 May 2023 15:36:56 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:36:36 PDT (-0700)
Subject: Re: [PATCH -next v19 03/24] riscv: hwprobe: Add support for RISCV_HWPROBE_BASE_BEHAVIOR_V
In-Reply-To: <CALs-HssafUZwXbxptGN3N-+2jD+6tvU=YbAZir9LsYwsEM8gBQ@mail.gmail.com>
CC: andy.chiu@sifive.com, heiko@sntech.de, linux-riscv@lists.infradead.org,
  anup@brainfault.org, atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
  Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>,
  ajones@ventanamicro.com, coelacanthus@outlook.com, abrestic@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Evan Green <evan@rivosinc.com>
Message-ID: <mhng-89e278d0-874b-4deb-b1c0-fde89cbeb06a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_153658_350529_D420DC7F 
X-CRM114-Status: GOOD (  45.79  )
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

T24gVHVlLCAwOSBNYXkgMjAyMyAxMToyOToyOCBQRFQgKC0wNzAwKSwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBUdWUsIE1heSA5LCAyMDIzIGF0IDEwOjU54oCvQU0gUGFsbWVyIERhYmJlbHQgPHBh
bG1lckBkYWJiZWx0LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgMDkgTWF5IDIwMjMgMTA6MzI6
MDMgUERUICgtMDcwMCksIEV2YW4gR3JlZW4gd3JvdGU6Cj4+ID4gT24gVHVlLCBNYXkgOSwgMjAy
MyBhdCA5OjQx4oCvQU0gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4+
ID4+Cj4+ID4+IE9uIFR1ZSwgTWF5IDksIDIwMjMgYXQgNzowNeKAr1BNIEhlaWtvIFN0w7xibmVy
IDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+PiA+PiA+Cj4+ID4+ID4gQW0gRGllbnN0YWcsIDku
IE1haSAyMDIzLCAxMjozMDoxMiBDRVNUIHNjaHJpZWIgQW5keSBDaGl1Ogo+PiA+PiA+ID4gUHJv
YmluZyBrZXJuZWwgc3VwcG9ydCBmb3IgVmVjdG9yIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUgbm93
Lgo+PiA+PiA+ID4KPj4gPj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFuZHkgQ2hpdSA8YW5keS5jaGl1
QHNpZml2ZS5jb20+Cj4+ID4+ID4gPiAtLS0KPj4gPj4gPiA+ICBEb2N1bWVudGF0aW9uL3Jpc2N2
L2h3cHJvYmUucnN0ICAgICAgIHwgMTAgKysrKysrKysrKwo+PiA+PiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vaHdwcm9iZS5oICAgICAgfCAgMiArLQo+PiA+PiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmggfCAgMyArKysKPj4gPj4gPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zeXNfcmlzY3YuYyAgICAgICAgIHwgIDkgKysrKysrKysrCj4+ID4+ID4gPiAgNCBm
aWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+ID4+ID4gPgo+
PiA+PiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgYi9E
b2N1bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4+ID4+ID4gPiBpbmRleCA5ZjBkZDYyZGNi
NWQuLmI4NzU1ZTE4MGZiZiAxMDA2NDQKPj4gPj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vcmlz
Y3YvaHdwcm9iZS5yc3QKPj4gPj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9i
ZS5yc3QKPj4gPj4gPiA+IEBAIC01Myw2ICs1Myw5IEBAIFRoZSBmb2xsb3dpbmcga2V5cyBhcmUg
ZGVmaW5lZDoKPj4gPj4gPiA+ICAgICAgICBwcm9ncmFtcyAoaXQgbWF5IHN0aWxsIGJlIGV4ZWN1
dGVkIGluIHVzZXJzcGFjZSB2aWEgYQo+PiA+PiA+ID4gICAgICAgIGtlcm5lbC1jb250cm9sbGVk
IG1lY2hhbmlzbSBzdWNoIGFzIHRoZSB2RFNPKS4KPj4gPj4gPiA+Cj4+ID4+ID4gPiArICAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0JBU0VfQkVIQVZJT1JfVmA6IFN1cHBvcnQgZm9yIFZlY3Rv
ciBleHRlbnNpb24sIGFzCj4+ID4+ID4gPiArICAgIGRlZmluZWQgYnkgdmVyaW9uIDEuMCBvZiB0
aGUgUklTQy1WIFZlY3RvciBleHRlbnNpb24uCj4+ID4+ID4KPj4gPj4gPiAgICAgICAgIF5eIHZl
cnNpb24gW21pc3NpbmcgdGhlIFNdCj4+ID4+ID4KPj4gPj4gPiA+ICsKPj4gPj4gPiA+ICAqIDpj
Om1hY3JvOmBSSVNDVl9IV1BST0JFX0tFWV9JTUFfRVhUXzBgOiBBIGJpdG1hc2sgY29udGFpbmlu
ZyB0aGUgZXh0ZW5zaW9ucwo+PiA+PiA+ID4gICAgdGhhdCBhcmUgY29tcGF0aWJsZSB3aXRoIHRo
ZSA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQWA6Cj4+ID4+ID4gPiAg
ICBiYXNlIHN5c3RlbSBiZWhhdmlvci4KPj4gPj4gPiA+IEBAIC02NCw2ICs2NywxMyBAQCBUaGUg
Zm9sbG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4+ID4+ID4gPiAgICAqIDpjOm1hY3JvOmBSSVND
Vl9IV1BST0JFX0lNQV9DYDogVGhlIEMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5l
ZAo+PiA+PiA+ID4gICAgICBieSB2ZXJzaW9uIDIuMiBvZiB0aGUgUklTQy1WIElTQSBtYW51YWwu
Cj4+ID4+ID4gPgo+PiA+PiA+ID4gKyogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX1ZfRVhU
XzBgOiBBIGJpdG1hc2sgY29udGFpbmluZyB0aGUgZXh0ZW5zaW9ucwo+PiA+PiA+ID4gKyAgIHRo
YXQgYXJlIGNvbXBhdGlibGUgd2l0aCB0aGUgOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfQkFTRV9C
RUhBVklPUl9WYDogYmFzZQo+PiA+PiA+ID4gKyAgIHN5c3RlbSBiZWhhdmlvci4KPj4gPj4gPiA+
ICsKPj4gPj4gPiA+ICsgICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfVmA6IFRoZSBWIGV4dGVu
c2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQgYnkKPj4gPj4gPiA+ICsgICAgdmVyc2lvbiAx
LjAgb2YgdGhlIFJJU0MtViBWZWN0b3IgZXh0ZW5zaW9uIG1hbnVhbC4KPj4gPj4gPiA+ICsKPj4g
Pj4gPgo+PiA+PiA+IHRoaXMgc2VlbXMgdG8gYmUgZG91YmxpbmcgdGhlIFJJU0NWX0hXUFJPQkVf
QkFTRV9CRUhBVklPUl9WIHN0YXRlIHdpdGhvdXQKPj4gPj4gPiBhZGRpbmcgYWRkaXRpb25hbCBp
bmZvcm1hdGlvbj8gQm90aCBlc3NlbnRpYWxseSB0ZWxsIHRoZSBzeXN0ZW0gdGhhdAo+PiA+PiA+
IFYgZXh0ZW5zaW9uICJkZWZpbmVkIGJ5IHZlcmlvbiAxLjAgb2YgdGhlIFJJU0MtViBWZWN0b3Ig
ZXh0ZW5zaW9uIiBpcyBzdXBwb3J0ZWQuCj4+ID4+Cj4+ID4+IEkgd2FzIHRoaW5raW5nIHRoYXQg
UklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1YgaW5kaWNhdGVzIHRoZSBrZXJuZWwKPj4gPj4g
aGFzIGEgcHJvYmUgZm9yIHZlY3RvciAoanVzdCBsaWtlIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhB
VklPUl9JTUEpIGFuZAo+PiA+PiBSSVNDVl9IV1BST0JFX0tFWV9WX0VYVF8wIGlzIHdoZXJlIHRo
ZSBrZXJuZWwgcmVwb3J0cyB3aGF0IGV4YWN0bHkgdGhlCj4+ID4+IGV4dGVuc2lvbiBpcy4gVGhp
cyBtYXBzIHRvIHRoZSBjb25kaXRpb24gbWF0Y2hpbmcgb2YgRixELCBhbmQgQyBpbgo+PiA+PiBJ
TUEuIElmIHRoYXQgaXMgbm90IHRoZSBjYXNlIHRoZW4gSSB0aGluayB0aGVyZSBpcyBubyBuZWVk
IGZvciB0aGlzCj4+ID4+IGVudHJ5Lgo+PiA+Pgo+PiA+PiA+Cj4+ID4+ID4gSSBkb24ndCBxdWVz
dGlvbiB0aGF0IHdlJ2xsIHByb2JhYmx5IG5lZWQgYSBrZXkgZm9yIGRlZXBlciB2ZWN0b3ItCj4+
ID4+ID4gc3BlY2lmaWNzIGJ1dCBJIGd1ZXNzIEknZCB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxk
IGRlZmluaXRseSBleHBsYWluCj4+ID4+ID4gd2h5IHRoZXJlIGlzIGEgZHVwbGljYXRpb24gaGVy
ZS4KPj4gPj4KPj4gPj4gSSBzdXBwb3NlIHNvbWV0aGluZyBsaWtlIFp2Zmggc2hvdWxkIGZhbGwg
aW50byB0aGUgY2F0ZWdvcnkgb2YKPj4gPj4gUklTQ1ZfSFdQUk9CRV9LRVlfVl9FWFRfMC4gSSB3
aWxsIGFkZCB0aGlzIGV4YW1wbGUgaW50byB0aGUgY29tbWl0Cj4+ID4+IG1lc3NhZ2UgaWYgeW91
IGFncmVlIHRoYXQgaXMgYSBnb29kIGV4YW1wbGUuCj4+ID4+Cj4+ID4+ID4KPj4gPj4gPgo+PiA+
PiA+ID4gICogOmM6bWFjcm86YFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMGA6IEEgYml0bWFz
ayB0aGF0IGNvbnRhaW5zIHBlcmZvcm1hbmNlCj4+ID4+ID4gPiAgICBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCj4+ID4+ID4gPgo+PiA+PiA+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9od3Byb2JlLmgKPj4gPj4gPiA+IGluZGV4IDc4OTM2ZjRmZjUxMy4uMzlkZjg2
MDRmZWExIDEwMDY0NAo+PiA+PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od3By
b2JlLmgKPj4gPj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdwcm9iZS5oCj4+
ID4+ID4gPiBAQCAtOCw2ICs4LDYgQEAKPj4gPj4gPiA+Cj4+ID4+ID4gPiAgI2luY2x1ZGUgPHVh
cGkvYXNtL2h3cHJvYmUuaD4KPj4gPj4gPiA+Cj4+ID4+ID4gPiAtI2RlZmluZSBSSVNDVl9IV1BS
T0JFX01BWF9LRVkgNQo+PiA+PiA+ID4gKyNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIDYK
Pj4gPj4gPiA+Cj4+ID4+ID4gPiAgI2VuZGlmCj4+ID4+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBp
L2FzbS9od3Byb2JlLmgKPj4gPj4gPiA+IGluZGV4IDhkNzQ1YTRhZDhhMi4uOTNhN2ZkM2ZkMzQx
IDEwMDY0NAo+PiA+PiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaAo+PiA+PiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUu
aAo+PiA+PiA+ID4gQEAgLTIyLDYgKzIyLDcgQEAgc3RydWN0IHJpc2N2X2h3cHJvYmUgewo+PiA+
PiA+ID4gICNkZWZpbmUgUklTQ1ZfSFdQUk9CRV9LRVlfTUlNUElEICAgICAyCj4+ID4+ID4gPiAg
I2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9CQVNFX0JFSEFWSU9SICAgICAgMwo+PiA+PiA+ID4g
ICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfQkFTRV9CRUhBVklPUl9JTUEgKDEg
PDwgMCkKPj4gPj4gPiA+ICsjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BST0JFX0JBU0Vf
QkVIQVZJT1JfViAgICgxIDw8IDEpCgpWIGlzbid0IGEgbmV3IGJhc2UsIGl0J3MganVzdCBhbiBh
ZGRvbiB0byBJTUEgbGlrZSBGRCBhbmQgQyBhcmUuICBTbyAKdGhpcyBzaG91bGQganVzdCBiZSBh
bm90aGVyIGJpdCBpbiB0aGUgUklTQ1ZfSFdQUk9CRV9LRVlfSU1BX0VYVF8wIApiaXRzZXQuICBU
aGF0J2xsIGFsc28gY2xlYXIgdXAgdGhlIGFib3ZlIGFib3V0IFYgYmVpbmcgaW5kaWNhdGVkIHR3
aWNlLgoKPj4gPj4gPiA+ICAjZGVmaW5lIFJJU0NWX0hXUFJPQkVfS0VZX0lNQV9FWFRfMCAgNAo+
PiA+PiA+ID4gICNkZWZpbmUgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfSU1BX0ZEICAgICAg
ICAgICAgKDEgPDwgMCkKPj4gPj4gPiA+ICAjZGVmaW5lICAgICAgICAgICAgICBSSVNDVl9IV1BS
T0JFX0lNQV9DICAgICAgICAgICAgICgxIDw8IDEpCj4+ID4+ID4gPiBAQCAtMzIsNiArMzMsOCBA
QCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7Cj4+ID4+ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0ZBU1QgICAgICAgICAgICgzIDw8IDApCj4+ID4+ID4g
PiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOU1VQUE9S
VEVEICAgICg0IDw8IDApCj4+ID4+ID4gPiAgI2RlZmluZSAgICAgICAgICAgICAgUklTQ1ZfSFdQ
Uk9CRV9NSVNBTElHTkVEX01BU0sgICAgICAgICAgICg3IDw8IDApCj4+ID4+ID4gPiArI2RlZmlu
ZSBSSVNDVl9IV1BST0JFX0tFWV9WX0VYVF8wICAgIDYKPj4gPj4gPiA+ICsjZGVmaW5lICAgICAg
ICAgICAgICBSSVNDVl9IV1BST0JFX1YgICAgICAgICAgICAgICAgICgxIDw8IDApCj4+ID4+ID4g
PiAgLyogSW5jcmVhc2UgUklTQ1ZfSFdQUk9CRV9NQVhfS0VZIHdoZW4gYWRkaW5nIGl0ZW1zLiAq
Lwo+PiA+PiA+ID4KPj4gPj4gPiA+ICAjZW5kaWYKPj4gPj4gPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5j
Cj4+ID4+ID4gPiBpbmRleCA1ZGIyOTY4M2ViZWUuLjYyODBhN2Y3NzhiMyAxMDA2NDQKPj4gPj4g
PiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4+ID4+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+PiA+PiA+ID4gQEAgLTEwLDYgKzEwLDcgQEAK
Pj4gPj4gPiA+ICAjaW5jbHVkZSA8YXNtL2NwdWZlYXR1cmUuaD4KPj4gPj4gPiA+ICAjaW5jbHVk
ZSA8YXNtL2h3cHJvYmUuaD4KPj4gPj4gPiA+ICAjaW5jbHVkZSA8YXNtL3NiaS5oPgo+PiA+PiA+
ID4gKyNpbmNsdWRlIDxhc20vdmVjdG9yLmg+Cj4+ID4+ID4gPiAgI2luY2x1ZGUgPGFzbS9zd2l0
Y2hfdG8uaD4KPj4gPj4gPiA+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPj4gPj4gPiA+ICAj
aW5jbHVkZSA8YXNtL3VuaXN0ZC5oPgo+PiA+PiA+ID4gQEAgLTE2MSw2ICsxNjIsNyBAQCBzdGF0
aWMgdm9pZCBod3Byb2JlX29uZV9wYWlyKHN0cnVjdCByaXNjdl9od3Byb2JlICpwYWlyLAo+PiA+
PiA+ID4gICAgICAgICovCj4+ID4+ID4gPiAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0JB
U0VfQkVIQVZJT1I6Cj4+ID4+ID4gPiAgICAgICAgICAgICAgIHBhaXItPnZhbHVlID0gUklTQ1Zf
SFdQUk9CRV9CQVNFX0JFSEFWSU9SX0lNQTsKPj4gPj4gPiA+ICsgICAgICAgICAgICAgcGFpci0+
dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9CQVNFX0JFSEFWSU9SX1Y7Cj4+ID4+ID4KPj4gPj4gPiBE
b2Vzbid0IHRoaXMgYWxzbyBuZWVkIGEKPj4gPj4gPiAgICAgICAgIGlmIChoYXNfdmVjdG9yKCkp
Cj4+ID4+ID4KPj4gPj4KPj4gPj4gSWYgdGhlIFJJU0NWX0hXUFJPQkVfS0VZX0JBU0VfQkVIQVZJ
T1IgcGFydCBqdXN0IHRlbGxzIHdoZXRoZXIgaHdwcm9iZQo+PiA+PiBzdXBwb3J0cyBwcm9iaW5n
IG9mIGEgc2V0IG9mIGV4dGVuc2lvbnMgdGhlbiBJIHRoaW5rIHdlIHNob3VsZCBub3QgYWRkCj4+
ID4+IHRoZSBpZiBzdGF0ZW1lbnQgaGVyZSwgYnV0IG1heWJlIEkgbWlzdW5kZXJzdG9vZCBzb21l
dGhpbmcuLgo+PiA+Cj4+ID4gVGhlIGludGVudGlvbiB3YXMgdG8gc2hvdyB0aGF0IHRoZSBJLCBN
LCBhbmQgQSBleHRlbnNpb25zIGFyZSBhY3R1YWxseQo+PiA+IHByZXNlbnQgb24gdGhpcyBtYWNo
aW5lLCBub3QgdGhhdCB0aGUgb3RoZXIgcHJvYmUga2V5cyBleGlzdC4gVXNlcm1vZGUKPj4gPiBp
cyBhbGxvd2VkIHRvIHF1ZXJ5IGFueSBod3Byb2JlIGtleSwgdGhleSBqdXN0IGdldCBiYWNrIHRo
ZSBrZXkgc2V0IHRvCj4+ID4gLTEgYW5kIHZhbHVlIHNldCB0byAwIG9uIHVua25vd24ga2V5cy4g
V2UgImNoZWF0ZWQiIGEgYml0IGZvcgo+PiA+IGRldGVybWluaW5nIEksIE0sIGFuZCBBIGV4aXN0
IHNpbmNlIHRoZXkncmUgYWxyZWFkeSBwcmVyZXF1aXNpdGVzIG9mCj4+ID4gTGludXgsIHdoaWNo
IGlzIHdoeSB0aGVyZSdzIG5vIGNvbmRpdGlvbmFsIHRoZXJlLgo+Pgo+PiBXZSBzaG91bGQgcHJv
YmFibHkgYWRkIGEgY29tbWVudCBzbyBpdCBkb2Vzbid0IHRyaXAgc29tZW9uZSB1cCBhZ2Fpbi4K
Pgo+IFRoZXJlIGlzIG9uZSB0aGVyZSwgaXQganVzdCBnb3QgY2xpcHBlZCBpbiB0aGUgY29udGV4
dCBkaWZmLiBJdCBsb29rcwo+IGxpa2UgdGhpcyAoYWZ0ZXIgZ21haWwgbWFuZ2xlcyBpdCk6Cj4K
PiAvKgo+ICogVGhlIGtlcm5lbCBhbHJlYWR5IGFzc3VtZXMgdGhhdCB0aGUgYmFzZSBzaW5nbGUt
bGV0dGVyIElTQQo+ICogZXh0ZW5zaW9ucyBhcmUgc3VwcG9ydGVkIG9uIGFsbCBoYXJ0cywgYW5k
IG9ubHkgc3VwcG9ydHMgdGhlCj4gKiBJTUEgYmFzZSwgc28ganVzdCBjaGVhdCBhIGJpdCBoZXJl
IGFuZCB0ZWxsIHRoYXQgdG8KPiAqIHVzZXJzcGFjZS4KPiAqLwo+IGNhc2UgUklTQ1ZfSFdQUk9C
RV9LRVlfQkFTRV9CRUhBVklPUjoKPiBwYWlyLT52YWx1ZSA9IFJJU0NWX0hXUFJPQkVfQkFTRV9C
RUhBVklPUl9JTUE7Cj4gYnJlYWs7CgpPSywgbm90IHN1cmUgaG93IHRvIG1ha2UgdGhhdCBtdWNo
IGNsZWFyZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
