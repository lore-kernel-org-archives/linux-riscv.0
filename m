Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60959C35274
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 01:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Axfth9KY3hhRr2rldM2uTDi/Y155vbCf11vSzKZXxGI=; b=YoTqTOqyAem1X2
	LHiClL8hTvPose/MGJV6JWriX0Yozqk0vhh6+xHznEQx6Pw4dqf1eU+mW2m5fBU3yiXJZ1qZ12c2O
	4IMM+qBQT9cZb6PLIGd7ruZvQ2se3pa+3o4l+JUf/mxWwEBAQSYn9/byyMrp1ZrJHjImpjCcLxqVc
	R/Y+7QNPbbwhZujYtldSWbWE9YJszgxsw+oftmwF4Ur1Wq3xeWVf+wxiNMIK/e9XbDbQq/GP2AbRv
	+tJvYN5Br1hj456cVSqDch+GWvsuojKLmM+tt0dw8o6WPeVLLWOW6dnwmHc522YM5cI0EoC2bDHko
	nHCndnWEeYUaIVHjECXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFP7q-00CVpe-1Q;
	Tue, 19 Dec 2023 01:42:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFP7o-00CVnO-0T
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 01:42:25 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cc61d4e5aeso29861251fa.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 17:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702950135; x=1703554935; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DJ6HujQaSqLNJaBNcsY++yK3kKdhHXKU0SDGTiPnm0=;
        b=I1s1cULqkAL0MjqcU455LDZ7AO1FbxuaT9VzStUIKsrKC1wWrSmuSEjPDEX9t7ksXF
         gm5EPnXR5KLisWvIkg2r3gbjkzjnBGhojKSgNUdYeq1cDvtRGRlMhqdMzVWjj6Tr8so1
         2J8siOmsS+urjfGMAShC1U59KGl5tJ/H1mVvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950135; x=1703554935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6DJ6HujQaSqLNJaBNcsY++yK3kKdhHXKU0SDGTiPnm0=;
        b=nCjeKGOWnUGfsKrku5Rimy0Z36IVVBNr6Vvpfv51p44jY/JTWfXLFdNaeA2FjvJZi0
         5LoECXucEZhubBL2y+FWrfpnRY1Vucf3n6cNogcQ/iwDi5yMBACNrdeI8KVQ0cyJeAsR
         4md9JKwx3A3l/GW6fNN7ZaM34PzMDYJt2LqpxLpv3JGkTOF5RMGXCdMIreaN+o9vW7CA
         zzCR80en73FPl0+a0Ysc2OmzckFFiGeJqTkzRZllpdgj+kuSS4hi7DD2eWy+vP11+qBQ
         xNrvjakAjHUtaK5JbP/jch+ONculcZmktYkl8MafAsCNjtcbgfuldIJsaciCiD+ywmKH
         +7lg==
X-Gm-Message-State: AOJu0Yx8WSfWhFjY+r9c6fZ2rpScn5LiZ4tWCPdvXfd/W7SjMk1hpAbX
	wJ8XrtA5J+sujBtGi9RGukHJ4VS2Y3c2VkGGPBAS
X-Google-Smtp-Source: AGHT+IGwmcBMd08oX7B8LObsbJ2O5rBGx51j04oYfIwxY8UVjXjH6a+FsM8o++Q7AdsMWjN3xu1zxG0FTTto6CSLGFI=
X-Received: by 2002:a2e:8645:0:b0:2cc:5cd5:9662 with SMTP id
 i5-20020a2e8645000000b002cc5cd59662mr2113474ljj.51.1702950135470; Mon, 18 Dec
 2023 17:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-19-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-19-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 18 Dec 2023 17:42:04 -0800
Message-ID: <CAOnJCUKsSyWmK0kkoTZ-R0dnaO2cONK8oD_kbRfipbZZ7Hrqig@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] RISC-V: KVM: Add SBI STA extension skeleton
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_174224_183424_6D6E7225 
X-CRM114-Status: GOOD (  18.94  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEFkZCB0aGUgZmlsZXMgYW5kIGZ1bmN0aW9ucyBu
ZWVkZWQgdG8gc3VwcG9ydCB0aGUgU0JJIFNUQQo+IChzdGVhbC10aW1lIGFjY291bnRpbmcpIGV4
dGVuc2lvbi4gSW4gdGhlIG5leHQgcGF0Y2hlcyB3ZSdsbAo+IGNvbXBsZXRlIHRoZSBmdW5jdGlv
bnMgdG8gZnVsbHkgZW5hYmxlIFNCSSBTVEEgc3VwcG9ydC4KPgo+IFJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25l
cyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX3ZjcHVfc2JpLmggfCAgMSArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9r
dm0uaCAgICAgfCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAgICAgICAgICAgICAg
fCAgMSArCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMgICAgICAgICAgICAgfCAgNCArKysK
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgICAgICAgICB8IDQ3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2JpLmgKPiBpbmRleCBiZmZkYTBhYzU5YjYuLjk5YzIz
YmIzN2EzNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3Ni
aS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9zYmkuaAo+IEBAIC03
Niw2ICs3Niw3IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2
Y3B1X3NiaV9leHRfcmZlbmNlOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9l
eHRlbnNpb24gdmNwdV9zYmlfZXh0X3Nyc3Q7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3Zj
cHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfaHNtOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0
IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2RiY247Cj4gK2V4dGVybiBjb25z
dCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfc3RhOwo+ICBleHRl
cm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2V4cGVy
aW1lbnRhbDsKPiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZj
cHVfc2JpX2V4dF92ZW5kb3I7Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXgg
NjBkM2IyMWRlYWQ3Li5lOTYxZDc5NjIyZmIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2
bS5oCj4gQEAgLTE1Nyw2ICsxNTcsNyBAQCBlbnVtIEtWTV9SSVNDVl9TQklfRVhUX0lEIHsKPiAg
ICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX0VYUEVSSU1FTlRBTCwKPiAgICAgICAgIEtWTV9SSVND
Vl9TQklfRVhUX1ZFTkRPUiwKPiAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX0RCQ04sCj4gKyAg
ICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVEEsCj4gICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9N
QVgsCj4gIH07Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgYi9hcmNo
L3Jpc2N2L2t2bS9NYWtlZmlsZQo+IGluZGV4IDRjMjA2N2ZjNTlmYy4uYzk2NDY1MjFmMTEzIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL01ha2VmaWxlCj4gKysrIGIvYXJjaC9yaXNjdi9r
dm0vTWFrZWZpbGUKPiBAQCAtMjYsNiArMjYsNyBAQCBrdm0tJChDT05GSUdfUklTQ1ZfU0JJX1Yw
MSkgKz0gdmNwdV9zYmlfdjAxLm8KPiAga3ZtLXkgKz0gdmNwdV9zYmlfYmFzZS5vCj4gIGt2bS15
ICs9IHZjcHVfc2JpX3JlcGxhY2Uubwo+ICBrdm0teSArPSB2Y3B1X3NiaV9oc20ubwo+ICtrdm0t
eSArPSB2Y3B1X3NiaV9zdGEubwo+ICBrdm0teSArPSB2Y3B1X3RpbWVyLm8KPiAga3ZtLSQoQ09O
RklHX1JJU0NWX1BNVV9TQkkpICs9IHZjcHVfcG11Lm8gdmNwdV9zYmlfcG11Lm8KPiAga3ZtLXkg
Kz0gYWlhLm8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyBiL2FyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCBkY2RmZjQ0NTgxOTAuLjA4OGRhYWEyM2RkOCAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIvYXJjaC9yaXNj
di9rdm0vdmNwdV9zYmkuYwo+IEBAIC03MCw2ICs3MCwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGt2bV9yaXNjdl9zYmlfZXh0ZW5zaW9uX2VudHJ5IHNiaV9leHRbXSA9IHsKPiAgICAgICAgICAg
ICAgICAgLmV4dF9pZHggPSBLVk1fUklTQ1ZfU0JJX0VYVF9EQkNOLAo+ICAgICAgICAgICAgICAg
ICAuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9leHRfZGJjbiwKPiAgICAgICAgIH0sCj4gKyAgICAgICB7
Cj4gKyAgICAgICAgICAgICAgIC5leHRfaWR4ID0gS1ZNX1JJU0NWX1NCSV9FWFRfU1RBLAo+ICsg
ICAgICAgICAgICAgICAuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9leHRfc3RhLAo+ICsgICAgICAgfSwK
PiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgLmV4dF9pZHggPSBLVk1fUklTQ1ZfU0JJX0VY
VF9FWFBFUklNRU5UQUwsCj4gICAgICAgICAgICAgICAgIC5leHRfcHRyID0gJnZjcHVfc2JpX2V4
dF9leHBlcmltZW50YWwsCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0
YS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uODM5OTExZGNkODM3Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5jCj4gQEAgLTAsMCArMSw0NyBAQAo+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsvKgo+ICsgKiBDb3B5cmlnaHQg
KGMpIDIwMjMgVmVudGFuYSBNaWNybyBTeXN0ZW1zIEluYy4KPiArICovCj4gKwo+ICsjaW5jbHVk
ZSA8bGludXgva3ZtX2hvc3QuaD4KPiArCj4gKyNpbmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+
Cj4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gKwo+ICtzdGF0aWMgaW50IGt2bV9zYmlfc3RhX3N0
ZWFsX3RpbWVfc2V0X3NobWVtKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAg
cmV0dXJuIFNCSV9FUlJfRkFJTFVSRTsKPiArfQo+ICsKPiArc3RhdGljIGludCBrdm1fc2JpX2V4
dF9zdGFfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHVfc2Jp
X3JldHVybiAqcmV0ZGF0YSkKPiArewo+ICsgICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAq
Y3AgPSAmdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBm
dW5jaWQgPSBjcC0+YTY7Cj4gKyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIHN3aXRjaCAo
ZnVuY2lkKSB7Cj4gKyAgICAgICBjYXNlIFNCSV9FWFRfU1RBX1NURUFMX1RJTUVfU0VUX1NITUVN
Ogo+ICsgICAgICAgICAgICAgICByZXQgPSBrdm1fc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1l
bSh2Y3B1KTsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBkZWZhdWx0Ogo+ICsg
ICAgICAgICAgICAgICByZXQgPSBTQklfRVJSX05PVF9TVVBQT1JURUQ7Cj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldGRhdGEtPmVycl92YWwgPSBy
ZXQ7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyB1bnNpZ25lZCBs
b25nIGt2bV9zYmlfZXh0X3N0YV9wcm9iZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4gK3sKPiAr
ICAgICAgIHJldHVybiAwOwo+ICt9Cj4gKwo+ICtjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4
dGVuc2lvbiB2Y3B1X3NiaV9leHRfc3RhID0gewo+ICsgICAgICAgLmV4dGlkX3N0YXJ0ID0gU0JJ
X0VYVF9TVEEsCj4gKyAgICAgICAuZXh0aWRfZW5kID0gU0JJX0VYVF9TVEEsCj4gKyAgICAgICAu
aGFuZGxlciA9IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyLAo+ICsgICAgICAgLnByb2JlID0ga3Zt
X3NiaV9leHRfc3RhX3Byb2JlLAo+ICt9Owo+IC0tCj4gMi40My4wCj4KClJldmlld2VkLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
