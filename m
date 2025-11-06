Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D35CCFA03
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 05:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQMIckaA4o9uzYO3Nj1Zxbv8EsV8nICz0O50pVUp2GE=; b=qw6S2voR728tp3
	l30IeNwwyEJykdWg39XvUrXaPFQy4AV2Pp4IRj3ExtbSO/CmrgUoZ5GIpSTBZmkEOonPxM2iyJCiH
	dbchVkf2/zdcIPM3+wjz9YozH8/kpmv7s1tCCIxsx9ieb65GXMVJfRoNOl9MuDQjFevTmHusSGX44
	XNWfPp0EuOqzMffvLnf5Nb9SMDNdueQM57eUfDp5PM9RlxlRo0XKACkXqZxZimjukF3kxpmsOhICC
	el1fKqyRHxMGOYvZ/xp5atjYeAeLUBwZxefSL3U4RxkVQ1XMKwxNW+tallprTAbv2uF0PqE6+tDHM
	niMQKeCSt61TqXgeMzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsqs-0000000EtuH-2W1W;
	Thu, 06 Nov 2025 05:48:06 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsqq-0000000Ett3-0s58
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 05:48:05 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-93e7e87c21bso47543139f.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Nov 2025 21:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762408083; x=1763012883; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uoew2SarmiylnjDmk3L9GFoWwHK51enAJRQNH2IHjc=;
        b=UPh/eDeR2X5DD4rzL+Fye/7FZfQnobz1HnjI/sris1ONAkeVb7w3kA3QGTSUeB++KH
         dfZo5HjwCJItwm9Mp+MLKjo0MRaD/yW3Vzw1DyvvryXd3cRa0B0LhZbQq5KqFvwBoUMN
         g7RqRn5YippgWbnmYhecDy0lBIQk6gSwMpfCpQyNCFxES1b42XibWFLwHs+bGQDRPnIM
         2M9T7t+S5mW6NcMigoR0pFzLB77chZUP0+N+QpHuR+7/pjnCLmnHyj8U+u+H6Kanv3vW
         NlDHCBR6hE7zkk8jEwxCmrGeNkMzhOsDHMXHBo0qSo+8Y884oldVBPwjQ+V61yOBmE0r
         ZjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762408083; x=1763012883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uoew2SarmiylnjDmk3L9GFoWwHK51enAJRQNH2IHjc=;
        b=Gr20EwuU3DpuD8b65qiUPmU0s5JzG/2AlOgsiEgO55Fx/pyxQlBzmRfagImQ3aUOqw
         HQDdQVltfGAmXETFPamyqKbH2uvp2003NspRSVlMRGRVRqyNdmP/06Qct0uig0fygfCo
         HxAIILMLy9RIwVCkk1+DIjFNm7oa8l+I83RzlYfLT78/t2MDOMZaUFAtfYXnKkNAXa2F
         SC+0SeaV9PGoclcIXDvZDe2T7XY4xDh2S/BMsvrlHAHyN4bAGFZZI7v4QstbvnElklmN
         M2sXs5MnTL3H0MEsX/ojGp4sObnaleuSg41Fz2vIVlX79Qp47Vx20umwrS0SRDYbFVRB
         v/qw==
X-Forwarded-Encrypted: i=1; AJvYcCWaj2JoZNyLPWMx0BwIhLHsFk8q80rE8BByQBY+fZyo5+S0uZVUjw0ezhWZGM5C+70Pm5UrRSevJ4IRfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj2c+ZwkFUlqB0xpwie6Ta/ii5WsfvAl7gsFJaXSr8LHlvXfxd
	LvIa8S2GJi4WjQFSKrTClgIdDihFr0+YZ38Zzf0EoIAB8ifAvefqM6VdQccTx/Lt7cwAGBlgTdg
	1OxC2Y05CS3ie2WUXNLn0/41Jvo5dKx4Vj3mUXOlzEQ==
X-Gm-Gg: ASbGncuz16WimO0GWRJYphiOZdJa2FLjYvavEN/TDeMsstVu3cXXuBqFPxOG8ugZ/8X
	pU7GvFVRnMyVg5DUZqoZxa0v446Fau3IhBAFJM97yY0Dv6U9bD4lYVsnSl8FeQF1YZG/C+xYriK
	XcOv7SMOTUNeHrAywzBoDH+EZBJVanLLf8ib4bbRUci0G0hl3T7abSs55wjo2UNYM9AFTmsAI1m
	/ER/fO/xGWn92A6VNbepuwXrqlGR1ku7nZqFPudfJ3fHecT8KYzQuEOxzl4ug==
X-Google-Smtp-Source: AGHT+IFbNEYpDbiUd8mOqCap1mJWhYJV/tTSDvIy+00/QF2eXniMKHHbQXm4twuBcloi6qoxWYJp8gwaXR8SH9byI/k=
X-Received: by 2002:a05:6e02:240b:b0:433:23f0:1ebf with SMTP id
 e9e14a558f8ab-43340779d13mr96165935ab.9.1762408083096; Wed, 05 Nov 2025
 21:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20250923053851.32863-1-xiangwencheng@lanxincomputing.com>
In-Reply-To: <20250923053851.32863-1-xiangwencheng@lanxincomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Nov 2025 11:17:51 +0530
X-Gm-Features: AWmQ_bllfHXAxLhpsO6n51JY0CLvNreW7JWG-sL9GnCN1uB2qpTsPmrk7YdRxzE
Message-ID: <CAAhSdy0OSCxo2oPYEhWjUJbOfx3HJ7Ak4KoVv4fi3ukKm6dRCg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Introduce KVM_EXIT_FAIL_ENTRY_NO_VSFILE
To: BillXiang <xiangwencheng@lanxincomputing.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, atish.patra@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_214804_509679_4D0E627B 
X-CRM114-Status: GOOD (  16.72  )
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

T24gVHVlLCBTZXAgMjMsIDIwMjUgYXQgMTE6MDnigK9BTSBCaWxsWGlhbmcKPHhpYW5nd2VuY2hl
bmdAbGFueGluY29tcHV0aW5nLmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHksIHdlIHJldHVybiBD
U1JfSFNUQVRVUyBhcyBoYXJkd2FyZV9lbnRyeV9mYWlsdXJlX3JlYXNvbiB3aGVuCj4ga3ZtX3Jp
c2N2X2FpYV9hbGxvY19oZ2VpIGZhaWxlZCBpbiBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0hXQUND
RUwKPiBtb2RlLCB3aGljaCBpcyB2YWd1ZSBzbyBpdCBpcyBiZXR0ZXIgdG8gcmV0dXJuIGEgd2Vs
bCBkZWZpbmVkIHZhbHVlCj4gS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEUgcHJvdmlkZWQg
dmlhIHVhcGkvYXNtL2t2bS5oLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmlsbFhpYW5nIDx4aWFuZ3dl
bmNoZW5nQGxhbnhpbmNvbXB1dGluZy5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0
ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBmb3IgTGludXgtNi4xOQoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAy
ICsrCj4gIGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jICAgICAgICB8IDIgKy0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
dWFwaS9hc20va3ZtLmgKPiBpbmRleCBlZjI3ZDQyODlkYTEuLjA2OGQ0ZDljZmY3YiAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmgKPiBAQCAtMjMsNiArMjMsOCBAQAo+ICAjZGVmaW5l
IEtWTV9JTlRFUlJVUFRfU0VUICAgICAgLTFVCj4gICNkZWZpbmUgS1ZNX0lOVEVSUlVQVF9VTlNF
VCAgICAtMlUKPgo+ICsjZGVmaW5lIEtWTV9FWElUX0ZBSUxfRU5UUllfTk9fVlNGSUxFICAoMVVM
TCA8PCAwKQo+ICsKPiAgLyogZm9yIEtWTV9HRVRfUkVHUyBhbmQgS1ZNX1NFVF9SRUdTICovCj4g
IHN0cnVjdCBrdm1fcmVncyB7Cj4gIH07Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBpbmRleCBmZGEwMzQ2ZjBl
YTEuLjkzNzk2M2ZiNDZjNSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
Ywo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gQEAgLTgwMiw3ICs4MDIsNyBA
QCBpbnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpCj4gICAgICAgICAgICAgICAgIC8qIEZvciBIVyBhY2NlbGVyYXRpb24gbW9kZSwgd2UgY2Fu
J3QgY29udGludWUgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGt2bS0+YXJjaC5haWEubW9kZSA9
PSBLVk1fREVWX1JJU0NWX0FJQV9NT0RFX0hXQUNDRUwpIHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICBydW4tPmZhaWxfZW50cnkuaGFyZHdhcmVfZW50cnlfZmFpbHVyZV9yZWFzb24gPQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBDU1JfSFNUQVRVUzsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgS1ZNX0VYSVRfRkFJTF9FTlRSWV9OT19WU0ZJTEU7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcnVuLT5mYWlsX2VudHJ5LmNwdSA9IHZjcHUtPmNw
dTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBydW4tPmV4aXRfcmVhc29uID0gS1ZNX0VYSVRf
RkFJTF9FTlRSWTsKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAtLQo+IDIu
NDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
