Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B5CE7C4DE
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5SMzGyph/Jl+dCv9AwKB8Y+lYcNe8hBmBatb4fJWzM=; b=sGjQJ7KzOsq3R2
	8Xwjwus4O+nDrReewNnQEVSla0n56wi23NG31u047pjmkixzyh61K8tlVu1a9B8PK/68uEaPKOD0N
	8n2npg587HOOZQY4ADmrIOJdxR4R+RkE6672EuNaQlYBVSMciu+0m5zAYc7GsN9rjecICiu9Eno5i
	F9K6xp8oyxHKS8QuCJWuKqj1+bgnSiVq0PHbKCYleHipWeLwsdfPANY0xGgUCNn+r2LC6MwN3v/8U
	5LqAc7koBwKJq+NJnMMauna5SHXb6OWLDEx1R1B8jpFdwNft0VunXOcLQvxep4mlZpU35IDgB1HFo
	laxV6OwWU9aa3BeNH3sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4WZ-000SOR-1d;
	Wed, 04 Oct 2023 16:14:59 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo4WV-000SNc-2F
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 16:14:57 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c27d653856so13875341fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 09:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696436092; x=1697040892; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onia9ZXddgiWIBxPSpKXotqhiL6maonD9M/TcIyvZv0=;
        b=bz0bWcQN1pMY9RRuJMLfsoC2X8tj8QgCOhkMtwITsq3pBY1ANpCaZSdCezjMvItz88
         5mBtULGxTnxxsmYjqMIuyJ6aJMCQ93vOJrGzCpn4A6qPWuPwmSDC3Sb65Hd/vGm//zb6
         gmjm1pCCZrFhktZ0AdAysirGv8I3J73nKQC33Qir7yDfuWsIj6TvitYrBsUOwkFa5Sw4
         HQGybXCeWETRdXV22TFMvXtTeGBelbY+ZgO98lSeboG6V302Ox4I22XPhaRzyKxpLnd4
         cEv4Kh00WI+QZNGZPch3LEHcYEGGspf+z7Buf1AlKKCLt0Rt03OiiKh7+6YM+DfLa39G
         fWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436092; x=1697040892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onia9ZXddgiWIBxPSpKXotqhiL6maonD9M/TcIyvZv0=;
        b=GspykvtQPpl/fAEHHgWvJ/oa/brNVgwFWN/9iUEEf0Y50LYc+nMJXjuVo4pGKBOIYo
         99m/bEKT6n5zYMbJ/r68onhUKfLUW5uquWwxqRTTl06A9+GLzDrIjcZfYGKCcup0hE7Z
         He/OBsk3og6Hj+A0+2mZqVvfhlx7ZQmR8KB6SckBVyu2R/pnodiHUsL4/eFhEgc+QvpJ
         Bjc1msARBOcT9ILOpavJ08PySHnleYHr2roiS2VrPSRepeAyuEp5ihgHX/wlzqokXp3h
         MLf7d7sCCPlkBOnaPHRlfSY1ujhC9t+R1IU1/ahYC9Af2bHMxdk5gn7SjZaROW9lIZCy
         4kpw==
X-Gm-Message-State: AOJu0YxBQHWLXf4mdKSrdaIx8EEqbWcDHQOLHijv6FP3yCXcToNUQ/Zk
	DyqSd6DUDTfcbMAm5fQ5ZbUmBrYGZem/LAwgsnyr2w==
X-Google-Smtp-Source: AGHT+IG9LgKXqBL/h279dvV7+1Ztkauqr1nwPs9lDJUghGJ/1CgLpTFxyA+qh/AfNI8SCCyrl11wTOjX92/97vINqk8=
X-Received: by 2002:ac2:4e8d:0:b0:505:7a65:ad5a with SMTP id
 o13-20020ac24e8d000000b005057a65ad5amr48328lfr.26.1696436092314; Wed, 04 Oct
 2023 09:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231004151405.521596-1-cleger@rivosinc.com> <20231004151405.521596-8-cleger@rivosinc.com>
In-Reply-To: <20231004151405.521596-8-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 4 Oct 2023 09:14:16 -0700
Message-ID: <CALs-HstxNBag7g74XSMJ-qu_ihp4WzA+PV2mf0MDkaRF3gV33w@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: report misaligned accesses emulation to hwprobe
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, =?UTF-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>, 
	Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_091455_969231_55F6005F 
X-CRM114-Status: GOOD (  29.16  )
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

T24gV2VkLCBPY3QgNCwgMjAyMyBhdCA4OjE04oCvQU0gQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJA
cml2b3NpbmMuY29tPiB3cm90ZToKPgo+IGh3cHJvYmUgcHJvdmlkZXMgYSB3YXkgdG8gcmVwb3J0
IGlmIG1pc2FsaWduZWQgYWNjZXNzIGFyZSBlbXVsYXRlZC4gSW4KPiBvcmRlciB0byBjb3JyZWN0
bHkgcG9wdWxhdGUgdGhhdCBmZWF0dXJlLCB3ZSBjYW4gY2hlY2sgaWYgaXQgYWN0dWFsbHkKPiB0
cmFwcyB3aGVuIGRvaW5nIGEgbWlzYWxpZ25lZCBhY2Nlc3MuIFRoaXMgY2FuIGJlIGNoZWNrZWQg
dXNpbmcgYW4KPiBleGNlcHRpb24gdGFibGUgZW50cnkgd2hpY2ggd2lsbCBhY3R1YWxseSBiZSB1
c2VkIHdoZW4gYSBtaXNhbGlnbmVkCj4gYWNjZXNzIGlzIGRvbmUgZnJvbSBrZXJuZWwgbW9kZS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgMTggKysrKysr
KysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgICB8ICA0ICsrCj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3NtcGJvb3QuYyAgICAgICAgICB8ICAyICstCj4gIGFyY2gvcmlzY3Yv
a2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8IDU2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiAgNCBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWZlYXR1cmUuaAo+IGluZGV4IGQwMzQ1YmQ2NTljOS4uZTRh
ZTZhZjUxODc2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVy
ZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKPiBAQCAtMzIs
NCArMzIsMjIgQEAgZXh0ZXJuIHN0cnVjdCByaXNjdl9pc2FpbmZvIGhhcnRfaXNhW05SX0NQVVNd
Owo+Cj4gIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2VzcyhpbnQgY3B1KTsKPgo+ICsjaWZkZWYg
Q09ORklHX1JJU0NWX01JU0FMSUdORUQKPiArYm9vbCB1bmFsaWduZWRfY3RsX2F2YWlsYWJsZSh2
b2lkKTsKPiArYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGludCBjcHUpOwo+
ICt2b2lkIHVuYWxpZ25lZF9lbXVsYXRpb25fZmluaXNoKHZvaWQpOwo+ICsjZWxzZQo+ICtzdGF0
aWMgaW5saW5lIGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCkKPiArewo+ICsgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGJvb2wgY2hlY2tfdW5h
bGlnbmVkX2FjY2Vzc19lbXVsYXRlZChpbnQgY3B1KQo+ICt7Cj4gKyAgICAgICByZXR1cm4gZmFs
c2U7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCB1bmFsaWduZWRfZW11bGF0aW9uX2Zp
bmlzaCh2b2lkKSB7fQo+ICsjZW5kaWYKPiArCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJl
LmMKPiBpbmRleCAzNTZlNTY3N2VlYjEuLmZiYmRlODAwYmMyMSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHVm
ZWF0dXJlLmMKPiBAQCAtNTY4LDYgKzU2OCw5IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vz
cyhpbnQgY3B1KQo+ICAgICAgICAgdm9pZCAqc3JjOwo+ICAgICAgICAgbG9uZyBzcGVlZCA9IFJJ
U0NWX0hXUFJPQkVfTUlTQUxJR05FRF9TTE9XOwo+Cj4gKyAgICAgICBpZiAoY2hlY2tfdW5hbGln
bmVkX2FjY2Vzc19lbXVsYXRlZChjcHUpKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+
ICAgICAgICAgcGFnZSA9IGFsbG9jX3BhZ2VzKEdGUF9OT1dBSVQsIGdldF9vcmRlcihNSVNBTElH
TkVEX0JVRkZFUl9TSVpFKSk7Cj4gICAgICAgICBpZiAoIXBhZ2UpIHsKPiAgICAgICAgICAgICAg
ICAgcHJfd2FybigiQ2FuJ3QgYWxsb2MgcGFnZXMgdG8gbWVhc3VyZSBtZW1jcHkgcGVyZm9ybWFu
Y2UiKTsKPiBAQCAtNjQ4LDYgKzY1MSw3IEBAIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzcyhp
bnQgY3B1KQo+ICBzdGF0aWMgaW50IF9faW5pdCBjaGVja191bmFsaWduZWRfYWNjZXNzX2Jvb3Rf
Y3B1KHZvaWQpCj4gIHsKPiAgICAgICAgIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoMCk7Cj4gKyAg
ICAgICB1bmFsaWduZWRfZW11bGF0aW9uX2ZpbmlzaCgpOwo+ICAgICAgICAgcmV0dXJuIDA7Cj4g
IH0KPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMKPiBpbmRleCAxYjhkYTRlNDBhNGQuLjVkOTg1OGQ2YWQyNiAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9zbXBib290LmMKPiBAQCAtMjQ1LDggKzI0NSw4IEBAIGFzbWxpbmthZ2UgX192
aXNpYmxlIHZvaWQgc21wX2NhbGxpbih2b2lkKQo+ICAgICAgICAgcmlzY3ZfaXBpX2VuYWJsZSgp
Owo+Cj4gICAgICAgICBudW1hX2FkZF9jcHUoY3Vycl9jcHVpZCk7Cj4gLSAgICAgICBzZXRfY3B1
X29ubGluZShjdXJyX2NwdWlkLCAxKTsKPiAgICAgICAgIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3Mo
Y3Vycl9jcHVpZCk7Cj4gKyAgICAgICBzZXRfY3B1X29ubGluZShjdXJyX2NwdWlkLCAxKTsKPgo+
ICAgICAgICAgaWYgKGhhc192ZWN0b3IoKSkgewo+ICAgICAgICAgICAgICAgICBpZiAocmlzY3Zf
dl9zZXR1cF92c2l6ZSgpKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiBpbmRl
eCBiNWZiMWZmMDc4ZTMuLmQ5OWI5NTA4NGI2YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMKPiBAQCAtMTQsNiArMTQsOCBAQAo+ICAjaW5jbHVkZSA8YXNtL3B0cmFjZS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICAjaW5jbHVkZSA8YXNtL2VudHJ5LWNvbW1vbi5o
Pgo+ICsjaW5jbHVkZSA8YXNtL2h3cHJvYmUuaD4KPiArI2luY2x1ZGUgPGFzbS9jcHVmZWF0dXJl
Lmg+Cj4KPiAgI2RlZmluZSBJTlNOX01BVENIX0xCICAgICAgICAgICAgICAgICAgMHgzCj4gICNk
ZWZpbmUgSU5TTl9NQVNLX0xCICAgICAgICAgICAgICAgICAgIDB4NzA3Zgo+IEBAIC0zOTYsNiAr
Mzk4LDggQEAgdW5pb24gcmVnX2RhdGEgewo+ICAgICAgICAgdTY0IGRhdGFfdTY0Owo+ICB9Owo+
Cj4gK3N0YXRpYyBib29sIHVuYWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKPiArCj4gIC8qIHN5
c2N0bCBob29rcyAqLwo+ICBpbnQgdW5hbGlnbmVkX2VuYWJsZWQgX19yZWFkX21vc3RseSA9IDE7
ICAgICAgIC8qIEVuYWJsZWQgYnkgZGVmYXVsdCAqLwo+Cj4gQEAgLTQwOSw2ICs0MTMsOCBAQCBp
bnQgaGFuZGxlX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QgcHRfcmVncyAqcmVncykKPgo+ICAgICAg
ICAgcGVyZl9zd19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3Ms
IGFkZHIpOwo+Cj4gKyAgICAgICAqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVl
ZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfRU1VTEFURUQ7Cj4gKwo+ICAgICAgICAgaWYg
KCF1bmFsaWduZWRfZW5hYmxlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC0xOwo+Cj4gQEAg
LTU4NSwzICs1OTEsNTMgQEAgaW50IGhhbmRsZV9taXNhbGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9y
ZWdzICpyZWdzKQo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+ICsKPiArYm9vbCBjaGVja191
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGludCBjcHUpCj4gK3sKPiArICAgICAgIGxvbmcgKm1h
c19wdHIgPSBwZXJfY3B1X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7Cj4gKyAg
ICAgICB1bnNpZ25lZCBsb25nIHRtcF92YXIsIHRtcF92YWw7Cj4gKyAgICAgICBib29sIG1pc2Fs
aWduZWRfZW11X2RldGVjdGVkOwo+ICsKPiArICAgICAgICptYXNfcHRyID0gUklTQ1ZfSFdQUk9C
RV9NSVNBTElHTkVEX1VOS05PV047Cj4gKwo+ICsgICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18g
KAo+ICsgICAgICAgICAgICAgICAiICAgICAgICJSRUdfTCIgJVt0bXBdLCAxKCVbcHRyXSlcbiIK
PiArICAgICAgICAgICAgICAgOiBbdG1wXSAiPXIiICh0bXBfdmFsKSA6IFtwdHJdICJyIiAoJnRt
cF92YXIpIDogIm1lbW9yeSIpOwo+ICsKPiArICAgICAgIG1pc2FsaWduZWRfZW11X2RldGVjdGVk
ID0gKCptYXNfcHRyID09IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9FTVVMQVRFRCk7Cj4gKyAg
ICAgICAvKgo+ICsgICAgICAgICogSWYgdW5hbGlnbmVkX2N0bCBpcyBhbHJlYWR5IHNldCwgdGhp
cyBtZWFucyB0aGF0IHdlIGRldGVjdGVkIHRoYXQgYWxsCj4gKyAgICAgICAgKiBDUFVTIHVzZXMg
ZW11bGF0ZWQgbWlzYWxpZ25lZCBhY2Nlc3MgYXQgYm9vdCB0aW1lLiBJZiB0aGF0IGNoYW5nZWQK
PiArICAgICAgICAqIHdoZW4gaG90cGx1Z2dpbmcgdGhlIG5ldyBjcHUsIHRoaXMgaXMgc29tZXRo
aW5nIHdlIGRvbid0IGhhbmRsZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKHVubGlrZWx5
KHVuYWxpZ25lZF9jdGwgJiYgIW1pc2FsaWduZWRfZW11X2RldGVjdGVkKSkgewo+ICsgICAgICAg
ICAgICAgICBwcl9jcml0KCJDUFUgbWlzYWxpZ25lZCBhY2Nlc3NlcyBub24gaG9tb2dlbmVvdXMg
KGV4cGVjdGVkIGFsbCBlbXVsYXRlZClcbiIpOwo+ICsgICAgICAgICAgICAgICB3aGlsZSAodHJ1
ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjcHVfcmVsYXgoKTsKClNvIHRoZSBpZGVhIGlz
IHRvIHNwaW4gbG9uZyBlbm91Z2ggdGhhdCB0aGUKd2FpdF9mb3JfY29tcGxldGlvbigmY3B1X3J1
bm5pbmcsIDEwMDBtcykgdGltZXMgb3V0PyBNYXliZSB0aGVyZQpzaG91bGQgYmUgYSB3ZmkoKSBp
biBoZXJlIGFzIHdlbGwgc28gd2UncmUgbm90IGp1c3QgYnVybmluZyB3aGl0ZSBob3QuCkhhdmUg
eW91IHZlcmlmaWVkIHRoYXQgaWYgd2UgZ2V0IGhlcmUsIHRoZSBDUFUgd2lsbCBhbHNvIGdldCB0
YWtlbgpiYWNrIGRvd24gYWZ0ZXIgdGhlIHRpbWVvdXQ/IEkgd29uZGVyIGlmIF9fY3B1X3VwKCkg
YWxzbyBuZWVkcyBhIGNhbGwKdG8gc3RvcCB0aGUgQ1BVLCBpbiB0aGUgY2FzZSB3aGVyZSB0aGF0
IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpCnRpbWVzIG91dC4KCkl0IGFsc28gbWlnaHQg
YmUgbW9yZSBpbnR1aXRpdmUgdG8gcmVvcmdhbml6ZSB0aGlzIHN1Y2ggdGhhdCB0aGUgZGVhdGgK
bG9vcCBoYXBwZW5zIGluIHNtcF9jYWxsaW4oKSwgYXMgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19l
bXVsYXRlZCgpIGlzCm5vdCBhIGZ1bmN0aW9uIHlvdSdkIGV4cGVjdCBtaWdodCBzb21ldGltZXMg
bmV2ZXIgcmV0dXJuLgoKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
