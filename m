Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2DAC4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 03:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XNXIRNMntAn5PkjIvjt3tZUTvkzv4G8Z/7tIZ4pQ5VY=; b=REVEcMhU3qsTJtAYT6VMtrcOqB
	UAiFzFpp1khdu0hygBeor84yC0W+3mXYGgvubSeq6IeyDbLJV4X2srZbfFcuwLKQiAjHETly4sWRh
	O0d9/tzUKBx3udievNT5ehg6VGzv6VU/PuXimNe7aFFyPPdI90twgirDncPJgrN5YvrcrMQyeQkmj
	8PcOVobKaRcYmbBgR7i0wyAlo+hOWYlozp9pAH7IkO8TDXv0ULeBWH7GDPL4/qslBxKJd+4lfNhxN
	nLJM652fP4NBAmOzPWWIb75CCNoGn1mte3q7IZ8/n6fE87xzabuxB+0s4btUcClDbeeWcSBQyttN3
	3DopQoJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0vgq-005AtN-00;
	Thu, 09 Nov 2023 03:26:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0vgm-005ArU-36
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 03:26:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc938f9612so2915985ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 19:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699500395; x=1700105195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SL43KqdoOApMZsa3YMezQNkvoYmYG9YJ6cT/naFj7n0=;
        b=VRcxDV8PKE64nWoC/ljvNbzPaWSldigzxdpQ32DCmmGCnG+mJ5f69iROWiNn78biax
         xC1bG4bJgma1IdsErb1IpwzO+yOFss9/BX2YdMg2gTEdtfNNw/gvpxO+eeRrrPbefP2Z
         aWfGXqa+iyVRrDEBfzMBJa+J5cZLW1xccJDpKGggEiS+ikE9kohhqk6w5TeNNaNp+XeG
         H1pa3d/5+46Nq80zgmg/b58H71QDTCn8403ydjeAks3eOR1rRL3VUsxbvAQ8VkdJRdy8
         jFaIlbsmQxI5PbsPBf3Af7VMxWGYBbaoB7bwqH3/cKaxAAXWqGVF5CPszdKasJbzvQzP
         EfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699500395; x=1700105195;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SL43KqdoOApMZsa3YMezQNkvoYmYG9YJ6cT/naFj7n0=;
        b=ayJMU1O9w/C3Cj3S46YYX2fwFxPxkyqlxqc5jK0hGWw7dJqufZeiIXT9FnYWTJHZJz
         yoM/3hFCfX6CX4HSVOcBn0AhZ33u/vyaxv3dcke693Ulo0IvM8Ack3dyo/L88D4pHX1x
         Obsax+Lk2s3a35dRq0bdiZxn/E4DNP+4cBUTHsTBIBnDpLCBoTvN8I/riFo2CUzfTcot
         qESfoGDjRdCcH+LpXZzqEzjd4qs96s42Qssv8bUpwq5TmeUnHs5IELZ12ff3uZsQmXPC
         4TfMyQ6bYR6BrgfnhQhzm+cl0PL5kaJ38uWDjGbA4nwCb1ymnZG+NJu4Vw8u/swThLxx
         bDhw==
X-Gm-Message-State: AOJu0YwiW13XtHX44ejOIOdEYWbnpaQSiIJjwtnsQFD/4GFm+kZPhNja
	wbq/igb5ZfS5KcUbNvaICis48A==
X-Google-Smtp-Source: AGHT+IGr7vGXKEc3TQWEMfgM2CHVvt0ly+Zqz32FmWgjh6G8g9LT1+KY6vb72CQ295XvF9UU+LAVYQ==
X-Received: by 2002:a17:902:ee89:b0:1cc:87f8:96ab with SMTP id a9-20020a170902ee8900b001cc87f896abmr4072748pld.38.1699500394683;
        Wed, 08 Nov 2023 19:26:34 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id jj19-20020a170903049300b001bbb25dd3a7sm2388288plb.187.2023.11.08.19.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 19:26:34 -0800 (PST)
Date: Wed, 08 Nov 2023 19:26:34 -0800 (PST)
X-Google-Original-Date: Wed, 08 Nov 2023 19:26:29 PST (-0800)
Subject: Re: [PATCH] selftests: sud_test: return correct emulated syscall value on RISC-V
In-Reply-To: <20230913140711.266975-1-cleger@rivosinc.com>
CC: shuah@kernel.org, krisman@collabora.com, linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, cleger@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: cleger@rivosinc.com
Message-ID: <mhng-bd15a99e-2c1e-4f0e-95ff-b6f14fe26681@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_192641_003675_99C36907 
X-CRM114-Status: GOOD (  23.81  )
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

T24gV2VkLCAxMyBTZXAgMjAyMyAwNzowNzoxMSBQRFQgKC0wNzAwKSwgY2xlZ2VyQHJpdm9zaW5j
LmNvbSB3cm90ZToKPiBDdXJyZW50bHksIHRoZSBzdWRfdGVzdCBleHBlY3RzIHRoZSBlbXVsYXRl
ZCBzeXNjYWxsIHRvIHJldHVybiB0aGUKPiBlbXVsYXRlZCBzeXNjYWxsIG51bWJlci4gVGhpcyBh
c3N1bXB0aW9uIG9ubHkgd29ya3Mgb24gYXJjaGl0ZWN0dXJlcwo+IHdlcmUgdGhlIHN5c2NhbGwg
Y2FsbGluZyBjb252ZW50aW9uIHVzZSB0aGUgc2FtZSByZWdpc3RlciBmb3Igc3lzY2FsbAo+IG51
bWJlci9zeXNjYWxsIHJldHVybiB2YWx1ZS4gVGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIFJJU0Mt
ViBhbmQgdGh1cwo+IHRoZSByZXR1cm4gdmFsdWUgbXVzdCBiZSBhbHNvIGVtdWxhdGVkIHVzaW5n
IHRoZSBwcm92aWRlZCB1Y29udGV4dC4KPgo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
c3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jCj4gaW5kZXggYjVkNTky
ZDQwOTllLi4xYjU1NTNjMTk3MDAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvc3lzY2FsbF91c2VyX2Rpc3BhdGNoL3N1ZF90ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYwo+IEBAIC0xNTgsNiAr
MTU4LDE0IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9zaWdzeXMoaW50IHNpZywgc2lnaW5mb190ICpp
bmZvLCB2b2lkICp1Y29udGV4dCkKPgo+ICAJLyogSW4gcHJlcGFyYXRpb24gZm9yIHNpZ3JldHVy
bi4gKi8KPiAgCVNZU0NBTExfRElTUEFUQ0hfT0ZGKGdsb2Jfc2VsKTsKPiArCj4gKwkvKgo+ICsJ
ICogTW9kaWZ5IGludGVycnVwdGVkIGNvbnRleHQgcmV0dXJuZWQgdmFsdWUgYWNjb3JkaW5nIHRv
IHN5c2NhbGwKPiArCSAqIGNhbGxpbmcgY29udmVudGlvbgo+ICsJICovCj4gKyNpZiBkZWZpbmVk
KF9fcmlzY3YpCj4gKwkoKHVjb250ZXh0X3QqKXVjb250ZXh0KS0+dWNfbWNvbnRleHQuX19ncmVn
c1tSRUdfQTBdID0gTUFHSUNfU1lTQ0FMTF8xOwo+ICsjZW5kaWYKPiAgfQo+Cj4gIFRFU1QoZGlz
cGF0Y2hfYW5kX3JldHVybikKCkknbSBub3Qgc3VyZSBpZiBJJ20ganVzdCB0aXJlZCwgYnV0IGl0
IHRvb2sgbWUgYSB3aGlsZSB0byBmaWd1cmUgb3V0IHdoeSAKdGhpcyB3YXMgbmVjZXNzYXJ5LiAg
SSB0aGluayB0aGlzIGlzIGEgYmV0dGVyIGV4cGxhbmF0aW9uOgoKICAgIGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3VkX3Rlc3QuYyBi
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5j
CiAgICBpbmRleCBiNWQ1OTJkNDA5OWUuLmE5MTNmZDkwY2ZhMyAxMDA2NDQKICAgIC0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3N5c2NhbGxfdXNlcl9kaXNwYXRjaC9zdWRfdGVzdC5jCiAg
ICArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9zeXNjYWxsX3VzZXJfZGlzcGF0Y2gvc3Vk
X3Rlc3QuYwogICAgQEAgLTE1OCw2ICsxNTgsMTYgQEAgc3RhdGljIHZvaWQgaGFuZGxlX3NpZ3N5
cyhpbnQgc2lnLCBzaWdpbmZvX3QgKmluZm8sIHZvaWQgKnVjb250ZXh0KQogICAgCiAgICAgCS8q
IEluIHByZXBhcmF0aW9uIGZvciBzaWdyZXR1cm4uICovCiAgICAgCVNZU0NBTExfRElTUEFUQ0hf
T0ZGKGdsb2Jfc2VsKTsKICAgICsJLyoKICAgICsJICogVGhlIHRlc3RzIGZvciBhcmd1bWVudCBo
YW5kbGluZyBhc3N1bWUgdGhhdCBgc3lzY2FsbCh4KSA9PSB4YC4gIFRoaXMKICAgICsJICogaXMg
YSBOT1Agb24geDg2IGJlY2F1c2UgdGhlIHN5c2NhbGwgbnVtYmVyIGlzIHBhc3NlZCBpbiAlcmF4
LCB3aGljaAogICAgKwkgKiBoYXBwZW5zIHRvIGFsc28gYmUgdGhlIGZ1bmN0aW9uIEFCSSByZXR1
cm4gcmVnaXN0ZXIuICBPdGhlcgogICAgKwkgKiBhcmNoaXRlY3R1cmVzIG1heSBuZWVkIHRvIHN3
aXp6bGUgdGhlIGFyZ3VtZW50cyBhcm91bmQuCiAgICArCSAqLwogICAgKyNpZiBkZWZpbmVkKF9f
cmlzY3YpCiAgICArCSh1Y29udGV4dF90Kil1Y29udGV4dCktPnVjX21jb250ZXh0Ll9fZ3JlZ3Nb
UkVHX0EwXSA9CiAgICArCQkodWNvbnRleHRfdCopdWNvbnRleHQpLT51Y19tY29udGV4dC5fX2dy
ZWdzW1JFR19BN107CiAgICArI2VuZGlmCiAgICAgfQogICAgCiAgICAgVEVTVChkaXNwYXRjaF9h
bmRfcmV0dXJuKQoKYnV0IGFsc28KClJldmlld2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QHJpdm9zaW5jLmNvbT4KQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMu
Y29tPgoKYXMgSSBhZ3JlZSB0aGlzIGlzIGNvcnJlY3QuCgphbHNvOiB3b3VsZG4ndCBhcm02NCBh
bHNvIG5lZWQgdG8gbW92ZSB4OCBpbnRvIHgwIGhlcmUsIGZvciBlc3NlbnRpYWxseSAKdGhlIHNh
bWUgcmVhc29uIGFzIHdlIGRvPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
