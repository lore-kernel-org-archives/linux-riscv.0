Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6960DC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 06:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrOSgnD7vMEG/tGh20KqngOJQxYs/QbFZq29lEGWkCU=; b=A887TwnUkuzl0n
	NdzUrWFk9FjzezhNmdAI3JJJu8Us3T2j4GVRgvmIx+69CrnjVHHNUUe1JuRlx4BgYDKXcAkEI2W86
	NKiWws+965hiKpKrDUBFIu3Di1LKhL7w9fnHR1+SbTyJSMVyRmnFSpaIeBf8QxVse39V1ZhMEbVmY
	k/4Jp6xDnd7TAyFbK+Pahdjq6QkbOGwCecSucoQGCqgsd2wB3H5SmKVhRF9VI/+TzHM7OnRTmNhy1
	F8xiW+VBf/jkJGOOdgsMJo7+6CzfAdXuT0zsaHLcprUUpbiIZrhoisFoAuTSo7YExMmb8JKyOYqPT
	54oXih+1tG7hDsroo0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1Q6-0029kX-1q;
	Fri, 15 Dec 2023 06:11:34 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE1Q3-0029jn-1t
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 06:11:33 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-5910b21896eso304924eaf.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 22:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702620689; x=1703225489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4CuwslJCLZdFAvkNN2l2KjFdYLuERyqcydxPniI+xQ=;
        b=mGk0IRWwDo8VeBqo76ie+U/vp5Xqc8RFtG6bPIguiuw8SWatD2L5EdveEBk/pabUXC
         g5r96mZnzUNrRm1wEqYxtk75Yz31TDGC6ee/nShtH/kCQstn83opmr0rATZgs5GRyFsd
         ZA2cDx9W9EY61fhjyfH41nP5nUnkihPvDSQ5A7gyH9KjJHx2Nqi3Mg5Via+lMhvy3ROy
         roNdZzGcXCb9jmwTsgPfSuE32ynOpX+BsZ6ykifFhBAEfS+qnonJ6fb3JmEfpa00qy9b
         BTBflqSsoVTqNuoVhqB0jgKU8pOrAcbw+8a77LZOxIOFsB3yqIqX/HNAdJ1VbiIEtkk7
         id9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702620689; x=1703225489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P4CuwslJCLZdFAvkNN2l2KjFdYLuERyqcydxPniI+xQ=;
        b=SI5fxbyM3kn5x0uN+wiPEjizhjJPqCPf2rYpTWzx7mi+Axrir6atyzkutiUV5SaNKu
         7l9ZPKmaK2pM0S8uMzLUPvXsBk9MDugIPV+5tJa85CXi4tS+4CuhK+lw2mUyoJyEYsI4
         lfT5lszpIsCpGO18n3CJY8h7F2ZIQu36ATbf5PtE5WPYgPUnCCy5iUk4IMF3UFU43zMi
         Ivt6/R/llXB06phEk10WPHy19NTK0DE/HMWNHj93byMcJPv34YcQlT3zlVohmX3KTWXY
         44iH7ShogJi+9eDbnuqJ74exD2q2XMdbLa6QRXe0KEhMIggrKnf1U2/u+vch6JnyvCV5
         1EJw==
X-Gm-Message-State: AOJu0YyM45NNPA6AIFWvoH/5EiVWjgIZ4p4ke7Lub1dYIRfUr4ewTflr
	G008PT2f/XXehGypA2twIXugh6qWUJXldvmr0rQgqw==
X-Google-Smtp-Source: AGHT+IGeNpSlR68lmDkvGx8mLKM0Vwb+RiJh/2h+wPwgctdIm3RPWxskr9cb3Bmda3SSGjTEZ21zTzYuwPeGh3WWFfw=
X-Received: by 2002:a05:6358:ca9:b0:170:309e:fbac with SMTP id
 o41-20020a0563580ca900b00170309efbacmr7378009rwj.55.1702620688704; Thu, 14
 Dec 2023 22:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-19-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-19-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 11:41:16 +0530
Message-ID: <CAAhSdy2DOyDP_dE3MUN=+9UhkzdMHaOHUbCJYgF9ZtWWpodWcg@mail.gmail.com>
Subject: Re: [PATCH v2 04/13] RISC-V: KVM: Add SBI STA extension skeleton
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_221131_650393_3DEB8223 
X-CRM114-Status: GOOD (  19.08  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBmaWxlcyBhbmQgZnVuY3Rpb25zIG5l
ZWRlZCB0byBzdXBwb3J0IHRoZSBTQkkgU1RBCj4gKHN0ZWFsLXRpbWUgYWNjb3VudGluZykgZXh0
ZW5zaW9uLiBJbiB0aGUgbmV4dCBwYXRjaGVzIHdlJ2xsCj4gY29tcGxldGUgdGhlIGZ1bmN0aW9u
cyB0byBmdWxseSBlbmFibGUgU0JJIFNUQSBzdXBwb3J0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5k
cmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4g
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmggfCAgMSArCj4gIGFyY2gvcmlz
Y3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL01h
a2VmaWxlICAgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMg
ICAgICAgICAgICAgfCAgNCArKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgICAg
ICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQs
IDU0IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX3N0YS5jCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
dmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBpbmRl
eCBiZmZkYTBhYzU5YjYuLjk5YzIzYmIzN2EzNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
dm1fdmNwdV9zYmkuaAo+IEBAIC03Niw2ICs3Niw3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3Zt
X3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfcmZlbmNlOwo+ICBleHRlcm4gY29uc3Qg
c3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3Nyc3Q7Cj4gIGV4dGVy
biBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfaHNtOwo+
ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0
X2RiY247Cj4gK2V4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1
X3NiaV9leHRfc3RhOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNp
b24gdmNwdV9zYmlfZXh0X2V4cGVyaW1lbnRhbDsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1f
dmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF92ZW5kb3I7Cj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gaW5kZXggNjBkM2IyMWRlYWQ3Li5lOTYxZDc5NjIyZmIgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNj
di9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gQEAgLTE1Nyw2ICsxNTcsNyBAQCBlbnVtIEtWTV9S
SVNDVl9TQklfRVhUX0lEIHsKPiAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX0VYUEVSSU1FTlRB
TCwKPiAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX1ZFTkRPUiwKPiAgICAgICAgIEtWTV9SSVND
Vl9TQklfRVhUX0RCQ04sCj4gKyAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEEsCj4gICAgICAg
ICBLVk1fUklTQ1ZfU0JJX0VYVF9NQVgsCj4gIH07Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2t2bS9NYWtlZmlsZQo+IGluZGV4IDRjMjA2N2Zj
NTlmYy4uYzk2NDY1MjFmMTEzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL01ha2VmaWxl
Cj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUKPiBAQCAtMjYsNiArMjYsNyBAQCBrdm0t
JChDT05GSUdfUklTQ1ZfU0JJX1YwMSkgKz0gdmNwdV9zYmlfdjAxLm8KPiAga3ZtLXkgKz0gdmNw
dV9zYmlfYmFzZS5vCj4gIGt2bS15ICs9IHZjcHVfc2JpX3JlcGxhY2Uubwo+ICBrdm0teSArPSB2
Y3B1X3NiaV9oc20ubwo+ICtrdm0teSArPSB2Y3B1X3NiaV9zdGEubwo+ICBrdm0teSArPSB2Y3B1
X3RpbWVyLm8KPiAga3ZtLSQoQ09ORklHX1JJU0NWX1BNVV9TQkkpICs9IHZjcHVfcG11Lm8gdmNw
dV9zYmlfcG11Lm8KPiAga3ZtLXkgKz0gYWlhLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmkuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCBkY2RmZjQ0
NTgxOTAuLjA4OGRhYWEyM2RkOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBAIC03MCw2ICs3MCwxMCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5IHNiaV9l
eHRbXSA9IHsKPiAgICAgICAgICAgICAgICAgLmV4dF9pZHggPSBLVk1fUklTQ1ZfU0JJX0VYVF9E
QkNOLAo+ICAgICAgICAgICAgICAgICAuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9leHRfZGJjbiwKPiAg
ICAgICAgIH0sCj4gKyAgICAgICB7Cj4gKyAgICAgICAgICAgICAgIC5leHRfaWR4ID0gS1ZNX1JJ
U0NWX1NCSV9FWFRfU1RBLAo+ICsgICAgICAgICAgICAgICAuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9l
eHRfc3RhLAo+ICsgICAgICAgfSwKPiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgLmV4dF9p
ZHggPSBLVk1fUklTQ1ZfU0JJX0VYVF9FWFBFUklNRU5UQUwsCj4gICAgICAgICAgICAgICAgIC5l
eHRfcHRyID0gJnZjcHVfc2JpX2V4dF9leHBlcmltZW50YWwsCj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODM5OTExZGNkODM3
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4g
QEAgLTAsMCArMSw0NyBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+
ICsvKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4K
PiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgva3ZtX2hvc3QuaD4KPiArCj4gKyNpbmNsdWRl
IDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gKwo+ICtzdGF0
aWMgaW50IGt2bV9zYmlfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVtKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkKPiArewo+ICsgICAgICAgcmV0dXJuIFNCSV9FUlJfRkFJTFVSRTsKPiArfQo+ICsKPiAr
c3RhdGljIGludCBrdm1fc2JpX2V4dF9zdGFfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHN0cnVjdCBrdm1fcnVuICpydW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX3JldHVybiAqcmV0ZGF0YSkKPiArewo+ICsgICAgICAgc3Ry
dWN0IGt2bV9jcHVfY29udGV4dCAqY3AgPSAmdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0Owo+ICsg
ICAgICAgdW5zaWduZWQgbG9uZyBmdW5jaWQgPSBjcC0+YTY7Cj4gKyAgICAgICBpbnQgcmV0Owo+
ICsKPiArICAgICAgIHN3aXRjaCAoZnVuY2lkKSB7Cj4gKyAgICAgICBjYXNlIFNCSV9FWFRfU1RB
X1NURUFMX1RJTUVfU0VUX1NITUVNOgo+ICsgICAgICAgICAgICAgICByZXQgPSBrdm1fc2JpX3N0
YV9zdGVhbF90aW1lX3NldF9zaG1lbSh2Y3B1KTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4g
KyAgICAgICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX05PVF9TVVBQ
T1JURUQ7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAg
IHJldGRhdGEtPmVycl92YWwgPSByZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiAr
Cj4gK3N0YXRpYyB1bnNpZ25lZCBsb25nIGt2bV9zYmlfZXh0X3N0YV9wcm9iZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCj4gK3sKPiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtjb25zdCBz
dHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfc3RhID0gewo+ICsgICAg
ICAgLmV4dGlkX3N0YXJ0ID0gU0JJX0VYVF9TVEEsCj4gKyAgICAgICAuZXh0aWRfZW5kID0gU0JJ
X0VYVF9TVEEsCj4gKyAgICAgICAuaGFuZGxlciA9IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyLAo+
ICsgICAgICAgLnByb2JlID0ga3ZtX3NiaV9leHRfc3RhX3Byb2JlLAo+ICt9Owo+IC0tCj4gMi40
My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
