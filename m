Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BB8E77181
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 01:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrQ0y4tzz1NIMq7QzNB7pwT8mXNwldbrCEVGyBxmBZo=; b=gaibU1EY3ZUcen
	fjbFjJifUNZYBqxHykTlqhLkI77m6npuBIA7yqRk9tUgUK/9SyaUY2NVoCaOLU3QjPDb2BL0iaMt1
	VgYmc+8lGnICJ+3S7u3KdjMIurSk4boqJs1SZEuHI++LUiYn4gFaNI6Zq8jayagUio0wwyu1sk2+z
	wQ7OkTKnrnv+cIiyACAdinAYU9dv+CltxHnJWRrGzd2zJT9JPwuB37KYkShWdukMpS9MfvEkGEXzI
	s49lFyi+KVMjENJpNTLgPBfQcTnvpi3kfAnM3/19ev6wZ+iGZBClhVn9I9lsfF/8OU3rXBu9PnVmA
	FHptD6FLaAPNdhtkdvcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKosn-00000009ne1-0OFk;
	Tue, 10 Dec 2024 01:17:49 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKorh-00000009nQw-1uMs
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 01:16:43 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7259d6ae0c8so4204667b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 17:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1733793400; x=1734398200; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7J7kgWgBG7zDr62P+Eop70r3Co12mfVgVIEm97IsjBc=;
        b=Nl3/75YekVhzhzYV32A9jDrzA8RpITkhemNUT6U3K6IECTGD/sHnNKVRPsrMh+TZro
         BDZdfJmz7Jm90ddItHIt3LQc8NcCTp/ptsQx0/qv/6af4WP6CgOYjv3vqFOq8ODW2dRn
         5O1DdC27bcUiikntcU6dVuSVZDyLaZZrqNfRalpJr13xYCHqNA7sSjg7zIYagnTeD2KA
         oKHsmiDaDI71riWPt2xj0XbGWmNlbUD/HytlUPdf54yNSLoOwToTd2okCHdeiFlDmOwU
         Mtyg/dWbxLA2lgqps0+KER/0btb4JAbjn0NBxK25W5tIn7aLJ4LUvXm2Jj8ltSX3+LHb
         zf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733793400; x=1734398200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J7kgWgBG7zDr62P+Eop70r3Co12mfVgVIEm97IsjBc=;
        b=cicC/Xqaa/fcXwxLF+mHajWFpUNRHzAVFh0eWsxAaH0n1bCbp7ZQTdQMQ4D4hmws3O
         4tvbCSfyMgDNmT0TcvaIRO/XQL+afMLbKwmyOt8tLZdhdNjnGhJs3UD7cHyipwxsVo8p
         c4u+a0E7aGcdwf75m5oDrAR03Z/Wzq0XdXgnoGikJhL++XPHR8XNvsopo2+p6AAsdkVe
         J+p6LsEay2RJ8ANQku99i+qeJ9LmdeQrB5PNZ6fpoxwdnO7siugMUncaeQJCVvEUxBkJ
         rLnp8KL1TO/dF/+eetzBfuW9uksbr9cMFQM4J/Sybu3yCR9Rhj1/mtdxRD0XtAi2hz7a
         FnzA==
X-Gm-Message-State: AOJu0Yyx+1Ax81VUT97l1HPZ/gMN+tayWQsiIeCCHTsvTKBdkbO8cKij
	ruuPYA9AeDmJ/I/u5pF+gk1S3+khzReuCs8TS6nD5HX+FQ0Hf/+BqsaeLHHwpDbJV4JgN64BUnB
	3BAQlV0iX6qxvuaTkjU+Auxgold+DeEPns5DRSw==
X-Gm-Gg: ASbGnct/y9uTenfZG/176RLAcgtYsl7h8YX3hvpWuXvIMOK1Cr6cAzDYYIMF5GyEPEj
	DU6B9VCo5ClSiGl/q4xs+KEjpEEwLfMW+dg==
X-Google-Smtp-Source: AGHT+IFHWG7f/jrba0MmMIk74bj4FLvJsvbUDpvVWZRJa41JQQnsmT4zcuqnPTsbFg31v4fSgu0FSerblu+cl90/X5I=
X-Received: by 2002:a05:6a20:12cc:b0:1e0:ca95:3cb3 with SMTP id
 adf61e73a8af0-1e18713c3d0mr22123398637.37.1733793400400; Mon, 09 Dec 2024
 17:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com>
 <20241119-pmu_event_info-v1-7-a4f9691421f8@rivosinc.com> <8dc7e94c-4bf2-4367-8561-166bec6ec315@sifive.com>
In-Reply-To: <8dc7e94c-4bf2-4367-8561-166bec6ec315@sifive.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Mon, 9 Dec 2024 17:16:29 -0800
Message-ID: <CAHBxVyF73ZEuPk+skhr6jJbdUYWS6cm4=vneV8jrd=7Lh0H6vQ@mail.gmail.com>
Subject: Re: [PATCH 7/8] RISC-V: KVM: Implement get event info function
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_171641_486767_68AB295D 
X-CRM114-Status: GOOD (  26.22  )
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

T24gTW9uLCBEZWMgMiwgMjAyNCBhdCAzOjAy4oCvUE0gU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5o
b2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gSGkgQXRpc2gsCj4KPiBPbiAyMDI0LTExLTE5
IDI6MjkgUE0sIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gVGhlIG5ldyBnZXRfZXZlbnRfaW5mbyBm
dW5jaXRvbiBhbGxvd3MgdGhlIGd1ZXN0IHRvIHF1ZXJ5IHRoZSBwcmVzZW5jZQo+ID4gb2YgbXVs
dGlwbGUgZXZlbnRzIHdpdGggc2luZ2xlIFNCSSBjYWxsLiBDdXJyZW50bHksIHRoZSBwZXJmIGRy
aXZlcgo+ID4gaW4gbGludXggZ3Vlc3QgaW52b2tlcyBpdCBmb3IgYWxsIHRoZSBzdGFuZGFyZCBT
QkkgUE1VIGV2ZW50cy4gU3VwcG9ydAo+ID4gdGhlIFNCSSBmdW5jdGlvbiBpbXBsZW1lbnRhdGlv
biBpbiBLVk0gYXMgd2VsbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBdGlzaCBQYXRyYSA8YXRp
c2hwQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X3ZjcHVfcG11LmggfCAgMyArKwo+ID4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAg
ICAgICAgfCA2NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jICAgICAgICAgfCAgMyArKwo+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgNzMgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNw
dV9wbXUuaAo+ID4gaW5kZXggMWQ4NWI2NjE3NTA4Li45YTkzMGFmYzhmNTcgMTAwNjQ0Cj4gPiAt
LS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oCj4gPiArKysgYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3BtdS5oCj4gPiBAQCAtOTgsNiArOTgsOSBAQCB2
b2lkIGt2bV9yaXNjdl92Y3B1X3BtdV9pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7Cj4gPiAg
aW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdywKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2FkZHJfaGlnaCwgdW5zaWduZWQgbG9uZyBm
bGFncywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1f
dmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKTsKPiA+ICtpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2
ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdywK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzYWRkcl9o
aWdoLCB1bnNpZ25lZCBsb25nIG51bV9ldmVudHMsCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJu
ICpyZXRkYXRhKTsKPiA+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3BtdV9kZWluaXQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKPiA+ICB2b2lkIGt2bV9yaXNjdl92Y3B1X3BtdV9yZXNldChzdHJ1Y3Qg
a3ZtX3ZjcHUgKnZjcHUpOwo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1
X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ID4gaW5kZXggZWZkNjY4MzVjMmI4
Li5hMzBmN2VjMzE0NzkgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gPiBAQCAtNDU2LDYgKzQ1Niw3
MyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X3NuYXBzaG90X3NldF9zaG1lbShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcwo+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+
ID4KPiA+ICtpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11X2V2ZW50X2luZm8oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHNhZGRyX2xvdywKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzYWRkcl9oaWdoLCB1bnNpZ25lZCBsb25nIG51bV9l
dmVudHMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3MsIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRhKQo+ID4gK3sKPiA+ICsg
ICAgIHVuc2lnbmVkIGxvbmcgaHZhOwo+ID4gKyAgICAgc3RydWN0IHJpc2N2X3BtdV9ldmVudF9p
bmZvICplaW5mbzsKPiA+ICsgICAgIGludCBzaG1lbV9zaXplID0gbnVtX2V2ZW50cyAqIHNpemVv
ZigqZWluZm8pOwo+ID4gKyAgICAgYm9vbCB3cml0YWJsZTsKPiA+ICsgICAgIGdwYV90IHNobWVt
Owo+ID4gKyAgICAgdTMyIGVpZHgsIGV0eXBlOwo+ID4gKyAgICAgdTY0IGVjb25maWc7Cj4gPiAr
ICAgICBpbnQgcmV0Owo+ID4gKwo+ID4gKyAgICAgaWYgKGZsYWdzICE9IDAgfHwgKHNhZGRyX2xv
dyAmIChTWl8xNiAtIDEpKSkgewo+ID4gKyAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0lOVkFM
SURfUEFSQU07Cj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKyAgICAgfQo+ID4gKwo+
ID4gKyAgICAgc2htZW0gPSBzYWRkcl9sb3c7Cj4gPiArICAgICBpZiAoc2FkZHJfaGlnaCAhPSAw
KSB7Cj4gPiArICAgICAgICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBzaG1lbSB8PSAoKGdwYV90KXNhZGRyX2hpZ2ggPDwgMzIp
Owo+ID4gKyAgICAgICAgICAgICB9IGVsc2Ugewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBo
dmEgPSBrdm1fdmNwdV9nZm5fdG9faHZhX3Byb3QodmNwdSwgc2htZW0gPj4gUEFHRV9TSElGVCwg
JndyaXRhYmxlKTsKPiA+ICsgICAgIGlmIChrdm1faXNfZXJyb3JfaHZhKGh2YSkgfHwgIXdyaXRh
YmxlKSB7Cj4gPiArICAgICAgICAgICAgIHJldCA9IFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwo+
Cj4gVGhpcyBvbmx5IGNoZWNrcyB0aGUgZmlyc3QgcGFnZSBpZiB0aGUgYWRkcmVzcyBjcm9zc2Vz
IGEgcGFnZSBib3VuZGFyeS4gTWF5YmUKPiB0aGF0IGlzIG9rYXkgc2luY2Uga3ZtX3ZjcHVfcmVh
ZF9ndWVzdCgpL2t2bV92Y3B1X3dyaXRlX2d1ZXN0KCkgd2lsbCBmYWlsIGlmIGEKPiBsYXRlciBw
YWdlIGlzIGluYWNjZXNzaWJsZT8KPgoKVGhhdCdzIG15IGFzc3VtcHRpb24gYXMgd2VsbC4KV2Ug
Y2FuIGludm9rZSBrdm1fdmNwdV9nZm5fdG9faHZhX3Byb3QgaW4gYSBsb29wIHRvIHZhbGlkYXRl
IGFsbCB0aGUKcGFnZXMgc3RhcnRpbmcgd2l0aCBzaG1lbSB0aG91Z2guClRoZSBkaWZmZXJlbmNl
IHdvdWxkIGJlIHRoZSBlcnJvciBjb2RlIHJldHVybmVkCihTQklfRVJSX0lOVkFMSURfQUREUkVT
UyB2cyBTQklfRVJSX0ZBSUxVUkUpCndoaWNoIHRoZSBzcGVjaWZpY2F0aW9uIGFsbG93cyBhbnl3
YXlzLgoKTGV0IG1lIGtub3cgaWYgeW91IHRoaW5rIEtWTSBtdXN0IHZhbGlkYXRlIHRoZSBlbnRp
cmUgcmFuZ2UuIEkgY2FuIGFkZCBpbiB2Mi4KCj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0Owo+
ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgZWluZm8gPSBremFsbG9jKHNobWVtX3NpemUsIEdG
UF9LRVJORUwpOwo+ID4gKyAgICAgaWYgKCFlaW5mbykKPiA+ICsgICAgICAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gPiArCj4gPiArICAgICByZXQgPSBrdm1fdmNwdV9yZWFkX2d1ZXN0KHZjcHUs
IHNobWVtLCBlaW5mbywgc2htZW1fc2l6ZSk7Cj4gPiArICAgICBpZiAocmV0KSB7Cj4gPiArICAg
ICAgICAgICAgIHJldCA9IFNCSV9FUlJfRkFJTFVSRTsKPiA+ICsgICAgICAgICAgICAgZ290byBm
cmVlX21lbTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAgIGZvciAoaW50IGkgPSAwOyBpIDwg
bnVtX2V2ZW50czsgaSsrKSB7Cj4gPiArICAgICAgICAgICAgIGVpZHggPSBlaW5mb1tpXS5ldmVu
dF9pZHg7Cj4gPiArICAgICAgICAgICAgIGV0eXBlID0ga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF90
eXBlKGVpZHgpOwo+ID4gKyAgICAgICAgICAgICBlY29uZmlnID0ga3ZtX3BtdV9nZXRfcGVyZl9l
dmVudF9jb25maWcoZWlkeCwgZWluZm9baV0uZXZlbnRfZGF0YSk7Cj4gPiArICAgICAgICAgICAg
IHJldCA9IHJpc2N2X3BtdV9nZXRfZXZlbnRfaW5mbyhldHlwZSwgZWNvbmZpZywgTlVMTCk7Cj4g
PiArICAgICAgICAgICAgIGlmIChyZXQgPiAwKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVp
bmZvW2ldLm91dHB1dCA9IDE7Cj4KPiBUaGlzIGFsc28gbmVlZHMgdG8gd3JpdGUgYG91dHB1dGAg
aW4gdGhlIGVsc2UgY2FzZSB0byBpbmRpY2F0ZSB0aGF0IHRoZSBldmVudCBpcwo+IG5vdCBzdXBw
b3J0ZWQ7IHRoZSBzcGVjIGRvZXMgbm90IHJlcXVpcmUgdGhlIGNhbGxlciB0byBpbml0aWFsaXpl
IGJpdCAwIG9mCj4gb3V0cHV0IHRvIHplcm8uCj4KClN1cmUuIEFkZGVkLgoKPiBSZWdhcmRzLAo+
IFNhbXVlbAo+Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICBrdm1fdmNwdV93cml0ZV9ndWVz
dCh2Y3B1LCBzaG1lbSwgZWluZm8sIHNobWVtX3NpemUpOwo+ID4gKyAgICAgaWYgKHJldCkgewo+
ID4gKyAgICAgICAgICAgICByZXQgPSBTQklfRVJSX0ZBSUxVUkU7Cj4gPiArICAgICAgICAgICAg
IGdvdG8gZnJlZV9tZW07Cj4gPiArICAgICB9Cj4gPiArCj4gPiArZnJlZV9tZW06Cj4gPiArICAg
ICBrZnJlZShlaW5mbyk7Cj4gPiArb3V0Ogo+ID4gKyAgICAgcmV0ZGF0YS0+ZXJyX3ZhbCA9IHJl
dDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPiA+ICBpbnQga3ZtX3Jp
c2N2X3ZjcHVfcG11X251bV9jdHJzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrdm1fdmNwdV9zYmlfcmV0dXJuICpyZXRkYXRh
KQo+ID4gIHsKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYyBi
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jCj4gPiBpbmRleCBlNGJlMzRlMDNlODMuLmEw
MjBkOTc5ZDE3OSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5j
Cj4gPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9wbXUuYwo+ID4gQEAgLTczLDYgKzcz
LDkgQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIHN0cnVjdCBrdm1fcnVuICpydW4sCj4gPiAgICAgICBjYXNlIFNCSV9FWFRfUE1VX1NO
QVBTSE9UX1NFVF9TSE1FTToKPiA+ICAgICAgICAgICAgICAgcmV0ID0ga3ZtX3Jpc2N2X3ZjcHVf
cG11X3NuYXBzaG90X3NldF9zaG1lbSh2Y3B1LCBjcC0+YTAsIGNwLT5hMSwgY3AtPmEyLCByZXRk
YXRhKTsKPiA+ICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICBjYXNlIFNCSV9FWFRfUE1V
X0VWRU5UX0dFVF9JTkZPOgo+ID4gKyAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9w
bXVfZXZlbnRfaW5mbyh2Y3B1LCBjcC0+YTAsIGNwLT5hMSwgY3AtPmEyLCBjcC0+YTMsIHJldGRh
dGEpOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgIGRlZmF1bHQ6Cj4gPiAgICAg
ICAgICAgICAgIHJldGRhdGEtPmVycl92YWwgPSBTQklfRVJSX05PVF9TVVBQT1JURUQ7Cj4gPiAg
ICAgICB9Cj4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
