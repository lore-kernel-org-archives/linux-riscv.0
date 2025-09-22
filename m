Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82CFCAC5A7
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 03:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0FTbc9QthrBhDDEyJFbKryGnyoUoOrlLmxGfjliJ9U=; b=PfLS1ZMSSMJ4AN
	yl5SJxpOLH9vCxJbkHjql4h6+ysceN1+lYOmT19VC+4vugu6gogyQ3M5zXn0Xb5wcUTEZfO6yM60l
	E9eGcHZXCcCemFA7oHTA2H6cTOL0xekTFcupvZwtTqNQ7rWVqaMODydlsmaBEXkn2akjwQ6SbDbbg
	hp4PXxqdpBYCdes4bof+dXEpaBcO9m++PkPGBLfOTqt4eUFx7AkDYN6oBdlte8Dw9FJZu295vCrF2
	iwrRQRk4cIJ9/S4c0JG6EveiBm6oxtrf0cKeLC+nsIWMuGbemDFa7vNI4BEAZ3jy3/ZJmcY+IZuEy
	IF/rcIue++6NqLEg9v3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XWy-00000008iyJ-39Fr;
	Mon, 22 Sep 2025 03:48:00 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XWv-00000008ixN-1Qi3
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 03:47:59 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-892db7eb552so519791839f.1
        for <linux-riscv@lists.infradead.org>; Sun, 21 Sep 2025 20:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1758512876; x=1759117676; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGuVEvHGyfQ2BFC63znl+bSOQQ/TN+svZB+fJgEKx9M=;
        b=FtIIr0bVGEzyswlMxZDc8uCh+fGzgJlR1G69sw4r6u17e26OQanTc/2J+xS+LBH0Ve
         3uLvrwZKpYAMsByAl0N+SxXPx8ExR6u3OSeVeT6EHGbllZx3Qqk+EGpO8HbuOmQwUAKz
         BO64ddZhwG+R7jH0OHuOtQrwn4+/lpvTqRtU2s7njZtVDpES87RJHumov8xhxAQ+QtXR
         ilhsDn2F1DdW5UQ/WBYqKKCy+JFzhCTROdoqKb0Qvb/ICrJVIRPIIrDqWEjakOWBiBm5
         eGiX7/kRAjQcR22mUitM6+H7VRlPyTOz5V+QSaDdaINwgy9YfgfqgQdKj2nzyNLF+q+q
         D6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512876; x=1759117676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGuVEvHGyfQ2BFC63znl+bSOQQ/TN+svZB+fJgEKx9M=;
        b=HiOUPMykotkbUmCeTzFlkGLe3cj4IVhydKSdi+U8n6jAIwfJh8nLoTahicjXgYyoyz
         3fiDo6iH/1k0y6CGHFmtDxkOGo95QrRgLFqCLqsSIiq5OLH+LrDSkk6VzauUDzAMkJ7/
         yrl2xBbt0LSkJHnLC2gIXC6Y341WA50clMIynP9vD//gOi/8Ms9oN8YqcSAefbBfCTm4
         NZYvj+LDgqIXO2A9fXJYwz+1KK2DbPIBpGOBHO+xjrMSABBhfYuJV836lvOaVKzwFjHJ
         hqEeJnipVDaJO6MOdRWVNbb2H9h1kA2yXduMNoBRN2V15zc5U6aoJJdtAbpUXb7/Zaxa
         neXg==
X-Forwarded-Encrypted: i=1; AJvYcCUrr9HZeATWuurFd4C38rj6uPqsM6fp3eu/Ag2opgU1hx9hEtmxNwXpk4Uoo2AAX0mGsUKZSnpELBUv6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmaiZ1gJBw+lERKXwWPYA7FvYVJit8KmUgmDcFAHs1gCZXn4Eh
	TdcDc8vypUbxerzrqzDQ1YKLRtRlQ+UQX8f95EdaFCL6oEe6DuyL8B+cM8Tq+wU97okgBE2tdy1
	GRCib5IQmRmxJDMP6syLqQRz2nSJ7ALT37mBdHwAB1SMweaeCwPzYp4A=
X-Gm-Gg: ASbGnctQJTLQ1uF7Yke8wDmooVLg63virWyEp7EaMrnuk01WKkan0iZGA45LndV8YdQ
	pqHyWOFy/IBC3Q63ihcUl/UbaQkyvh8p0Cm0fOEQdb8uN9WDtR8aOwJlaG4EOPXYuISyBzBwQLW
	ZUpNqh9tzylgOTVEN4lKhjlrZ5EWyDOOmtgxd60IcTU9AEHkqCXDGMjy4r6uMyZVjcFqYEcGI96
	9DICjbc6fl27fAZvkyOGELZSIDUKaxt645vxYl7
X-Google-Smtp-Source: AGHT+IHO8DNLPyWRRVhnXNw51Hz0e4MEtudltvnf2lQqnZc/nn0n4GS3gLJxQNB6R7/XqLb0csBtp5kh4GKuFoaudA8=
X-Received: by 2002:a05:6e02:18ce:b0:424:7de2:61ca with SMTP id
 e9e14a558f8ab-4248199c624mr163717175ab.20.1758512876440; Sun, 21 Sep 2025
 20:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250714072051.1928-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250714072051.1928-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Sep 2025 09:17:45 +0530
X-Gm-Features: AS18NWCodXxq_NwRnNatjdWFDrBUIO_QWr6YpBDyOo-YuWb6ERuQ-Hm3OHSaNi8
Message-ID: <CAAhSdy1WaaSSdPqHQfNGdc98vfvF83YZYetd4jVPpHWQJEY5GQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: atish.patra@linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_204757_382493_DCA3B4A0 
X-CRM114-Status: GOOD (  20.92  )
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

T24gTW9uLCBKdWwgMTQsIDIwMjUgYXQgMTI6NTHigK9QTSBCaWxsWGlhbmcKPHhpYW5nd2VuY2hl
bmdAbGFueGluY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBDb25zaWRlciBhIHN5c3RlbSB3aXRo
IDggaGFydHMsIHdoZXJlIGVhY2ggaGFydCBzdXBwb3J0cyA1Cj4gR3Vlc3QgSW50ZXJydXB0IEZp
bGVzIChHSUZzKSwgeWllbGRpbmcgNDAgdG90YWwgR0lGcy4KPiBJZiB3ZSBsYXVuY2ggYSBRRU1V
IGd1ZXN0IHdpdGggb3ZlciA1IHZDUFVzIHVzaW5nCj4gIi1NIHZpcnQsYWlhPSdhcGxpYy1pbXNp
YycgLWFjY2VsIGt2bSxyaXNjdi1haWE9aHdhY2NlbCIg4oCTIHdoaWNoCj4gcmVsaWVzIHNvbGVs
eSBvbiBWUy1maWxlcyAobm90IFNXLWZpbGVzKSBmb3IgaGlnaGVyIHBlcmZvcm1hbmNlIOKAkyB0
aGUKPiBndWVzdCByZXF1aXJlcyBtb3JlIHRoYW4gNSBHSUZzLiBIb3dldmVyLCB0aGUgY3VycmVu
dCBMaW51eCBzY2hlZHVsZXIKPiBsYWNrcyBHSUYgYXdhcmVuZXNzLCBwb3RlbnRpYWxseSBzY2hl
ZHVsaW5nID41IHZDUFVzIHRvIGEgc2luZ2xlIGhhcnQuCj4gVGhpcyB0cmlnZ2VycyBWUy1maWxl
IGFsbG9jYXRpb24gZmFpbHVyZSwgYW5kIHNpbmNlIG5vIGhhbmRsZXIgZXhpc3RzCj4gZm9yIHRo
aXMgZXJyb3IsIHRoZSBRRU1VIGd1ZXN0IGJlY29tZXMgY29ycnVwdGVkLgo+Cj4gVG8gYWRkcmVz
cyB0aGlzLCB3ZSBpbnRyb2R1Y2UgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUgdXBvbgo+
IFZTLWZpbGUgYWxsb2NhdGlvbiBmYWlsdXJlLiBUaGlzIHByb3ZpZGVzIGFuIG9wcG9ydHVuaXR5
IGZvciBncmFjZWZ1bAo+IGVycm9yIGhhbmRsaW5nIGluc3RlYWQgb2YgY29ycnVwdGlvbi4gRm9y
IGV4YW1wbGUsIFFFTVUgY2FuIGhhbmRsZQo+IHRoaXMgZXhpdCBieSByZXNjaGVkdWxpbmcgdkNQ
VXMgdG8gYWx0ZXJuYXRpdmUgaGFydHMgd2hlbiBWUy1maWxlCj4gYWxsb2NhdGlvbiBmYWlscyBv
biB0aGUgY3VycmVudCBoYXJ0IFsxXS4KCkN1cnJlbnRseSwgd2UgcmV0dXJuIENTUl9IU1RBVFVT
IGFzIGhhcmR3YXJlX2VudHJ5X2ZhaWx1cmVfcmVhc29uCndoaWNoIGlzIHZhZ3VlIHNvIGl0IGlz
IGJldHRlciB0byByZXR1cm4gYSB3ZWxsIGRlZmluZWQgdmFsdWUgcHJvdmlkZWQgdmlhCnVhcGkv
YXNtL2t2bS5oLiBJbiBnZW5lcmFsLCB0aGlzIHBhdGNoIGlzIGZpbmUgYnV0IHRoZSBjb21taXQg
ZGVzY3JpcHRpb24KbmVlZHMgdG8gYmUgaW1wcm92ZWQgYWxvbmcgdGhlc2UgbGluZXMuCgpSZWdh
cmRzLApBbnVwCgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9CaWxsWGlhbmcvcWVtdS90cmVl
L3Jpc2N2LXZzZmlsZS1hbGxvYy8KPgo+IFNpZ25lZC1vZmYtYnk6IEJpbGxYaWFuZyA8eGlhbmd3
ZW5jaGVuZ0BsYW54aW5jb21wdXRpbmcuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmggfCAyICsrCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBpbmRleCA1ZjU5ZmQyMjZjYzUuLmJl
MjljMzUwMmZlNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3Zt
LmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMjIsNiAr
MjIsOCBAQAo+ICAjZGVmaW5lIEtWTV9JTlRFUlJVUFRfU0VUICAgICAgLTFVCj4gICNkZWZpbmUg
S1ZNX0lOVEVSUlVQVF9VTlNFVCAgICAtMlUKPgo+ICsjZGVmaW5lIEtWTV9FWElUX0ZBSUxfRU5U
UllfTk9fVlNGSUxFICAoMVVMTCA8PCAwKQo+ICsKPiAgLyogZm9yIEtWTV9HRVRfUkVHUyBhbmQg
S1ZNX1NFVF9SRUdTICovCj4gIHN0cnVjdCBrdm1fcmVncyB7Cj4gIH07Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMK
PiBpbmRleCAyOWVmOWMyMTMzYTkuLjY5YjBhYjY1MTM4OSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4g
QEAgLTc2MCw3ICs3NjAsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gICAgICAgICAgICAgICAgIC8qIEZvciBIVyBhY2NlbGVy
YXRpb24gbW9kZSwgd2UgY2FuJ3QgY29udGludWUgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGt2
bS0+YXJjaC5haWEubW9kZSA9PSBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0hXQUNDRUwpIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBydW4tPmZhaWxfZW50cnkuaGFyZHdhcmVfZW50cnlfZmFp
bHVyZV9yZWFzb24gPQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBDU1JfSFNUQVRVUzsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0VYSVRfRkFJ
TF9FTlRSWV9OT19WU0ZJTEU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcnVuLT5mYWlsX2Vu
dHJ5LmNwdSA9IHZjcHUtPmNwdTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBydW4tPmV4aXRf
cmVhc29uID0gS1ZNX0VYSVRfRkFJTF9FTlRSWTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiAtLQo+IDIuNDYuMi53aW5kb3dzLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
