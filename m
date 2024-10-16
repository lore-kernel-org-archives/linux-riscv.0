Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178A1D206A2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 06:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v2QCdDbrIHLXJ05ukQYc123zantaC0rlJ7lZ+PO2n3M=; b=wOknG/L0bFvjvv
	/pQpPKkYsM8/46Utif6q+bQFqVjliPTMuzncxBjjjCeLDlUS1nXskKp3tXhqV3LeFqE/Y8ZSQ5U6z
	24Lg7XocAQ8x7JPlVfvvBXfUuB8EEgVWP47xa1ikYUXdhPWayswNM4ESHpB71byBrm+sL3Cbnkf/a
	UcCqxxeV2vyklrkMJi0wm40BNVTU3tG3Rgwjds8sA7hsjznzI1sLXgMXnoyYZEmI8jqXFSGWmUzSH
	29Tde1rWrQyP0ciq+P8kVFa5eU2EkXywKgVdH26YQOUIxjtic5Wei3Rvnvu/x/g2kuuloPtfhO/qi
	lnqcz2oBVKIVKeCRZtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xyh-0000000AknV-3j7O;
	Wed, 16 Oct 2024 06:57:51 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xr6-0000000AjPu-1oTi
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 06:50:01 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-3a3a7d5a156so22165165ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 23:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1729061399; x=1729666199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LuvWiWzGwPfPen/TP7UxW2wIuKmmBLuM/D7bBxMmtuI=;
        b=euBVREz1zJCiGWWD15W0F9SDF5OoKgxAvWRrYI+yj87JXtasrY1z4sh8sWO/C8MbHh
         ZLxTaolL2Plq+pmEMdq4UEb6nZjBL3tIG/Oz3/3ipjGEu5WCRCo8OUASp/opz1Rkhy9y
         hrYi7RE7YH563L3vlX8ase8i4/8Xkl+VaaNoReJRQRlEHwduHx6/xK8srK6OrKkgixVp
         3sDO4WHv61ypkrSyFz/kj99a7Tt0gvbDgwdEk7XJkhxuCY0PfoZZ5pr7CeIuv9H+R1ud
         xb+HO4KB5QA/z6IHkDen1hCTRhYjg8atIjeLK9Fk1EVZkt6gBPGLtUnFQpJz6OV50TwK
         tHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729061399; x=1729666199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LuvWiWzGwPfPen/TP7UxW2wIuKmmBLuM/D7bBxMmtuI=;
        b=wWuyoJ+rWVjs84MY5LGmALElVZ1w9Qp7nY/09bH9r9S2hVTNpBitF+0Iujhrwi5j1W
         /Qc8mkgcwedlleJhRWE0RHA6b5MZUqiubf4nLCCyKj8emNs/H00FYO4vEpPSOcPbk2Jh
         YabOlcpVtL+suGYOz8Qx5WwYFjcbtYERQyo4wvJL907kvoRa21lmWQHcdmnCCzzP36F4
         BiDSPgfPpWvFgPQzyrZyMv3xXbqFFxPlmwoXolQTzGClslMZDJ9FNv7z5svpEFdfosq7
         uElGht6wskmNrs7kIDA89+H1LPUcZ+WzfOQBJTWxlkJ29SjGsVArhCGaopmqCkLIjEwD
         QMew==
X-Forwarded-Encrypted: i=1; AJvYcCWxyht71HentO4dk2YVCqGQdy8kg1zTo/LHUcIRzMs048Ifcy7nNzBkK+zlzDhD3afKBR0/zYQAq4+LVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWrZ4wToT/Zr2Mk0dE6w3q5NAObBtxU+2y/4LEthCE5BH3RHPe
	hMnr8/sx1Ye+FW7q+NjLumluuT8ONwXs7OaKiOYmV0LQ78RwazDYl/Q53q2I9GZJ/LsIM+wlHJJ
	kJ1ivwjcQITvPbb9qyVs7bNXYf0MganpOp5xLvw==
X-Google-Smtp-Source: AGHT+IFNJEtM2qSm9Q8EfSRdRlQdHW4tYyXrD+ovJ8ZHMJJ/SIGchnJLPemWmR8X+ZItdkgt/8/Gty81UCalEdYkjjw=
X-Received: by 2002:a05:6e02:1a4f:b0:3a3:b254:ca2c with SMTP id
 e9e14a558f8ab-3a3bce11c80mr131491775ab.25.1729061399011; Tue, 15 Oct 2024
 23:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728579958.git.tjeznach@rivosinc.com> <6916f5308478013c7b4cda77403c1e9aa9982384.1728579958.git.tjeznach@rivosinc.com>
 <20241015085814.GB19110@willie-the-truck>
In-Reply-To: <20241015085814.GB19110@willie-the-truck>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Tue, 15 Oct 2024 23:49:48 -0700
Message-ID: <CAH2o1u5YLDuMNAy573ZrxS+Z8qqc0y1W9QoLyJ7P=AwcQ8LsxA@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] iommu/riscv: Command and fault queue support
To: Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235000_521990_413C2D7F 
X-CRM114-Status: GOOD (  27.12  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBPY3QgMTUsIDIwMjQgYXQgMTo1OOKAr0FNIFdpbGwgRGVhY29uIDx3aWxsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTAsIDIwMjQgYXQgMTI6NDg6MDlQTSAtMDcw
MCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gPiBJbnRyb2R1Y2UgZGV2aWNlIGNvbW1hbmQgc3Vi
bWlzc2lvbiBhbmQgZmF1bHQgcmVwb3J0aW5nIHF1ZXVlcywKPiA+IGFzIGRlc2NyaWJlZCBpbiBD
aGFwdGVyIDMuMSBhbmQgMy4yIG9mIHRoZSBSSVNDLVYgSU9NTVUgQXJjaGl0ZWN0dXJlCj4gPiBT
cGVjaWZpY2F0aW9uLgo+ID4KPiA+IENvbW1hbmQgYW5kIGZhdWx0IHF1ZXVlcyBhcmUgaW5zdGFu
dGlhdGVkIGluIGNvbnRpZ3VvdXMgc3lzdGVtIG1lbW9yeQo+ID4gbG9jYWwgdG8gSU9NTVUgZGV2
aWNlIGRvbWFpbiwgb3IgbWFwcGVkIGZyb20gZml4ZWQgSS9PIHNwYWNlIHByb3ZpZGVkCj4gPiBi
eSB0aGUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24uIERldGVjdGlvbiBvZiB0aGUgbG9jYXRpb24g
YW5kIG1heGltdW0KPiA+IGFsbG93ZWQgc2l6ZSBvZiB0aGUgcXVldWUgdXRpbGl6ZSBXQVJMIHBy
b3BlcnRpZXMgb2YgcXVldWUgYmFzZSBjb250cm9sCj4gPiByZWdpc3Rlci4gRHJpdmVyIGltcGxl
bWVudGF0aW9uIHdpbGwgdHJ5IHRvIGFsbG9jYXRlIHVwIHRvIDEyOEtCIG9mCj4gPiBzeXN0ZW0g
bWVtb3J5LCB3aGlsZSByZXNwZWN0aW5nIGhhcmR3YXJlIHN1cHBvcnRlZCBtYXhpbXVtIHF1ZXVl
IHNpemUuCj4gPgo+ID4gSW50ZXJydXB0cyBhbGxvY2F0aW9uIGlzIGJhc2VkIG9uIGludGVycnVw
dCB2ZWN0b3JzIGF2YWlsYWJpbGl0eSBhbmQKPiA+IGRpc3RyaWJ1dGVkIHRvIGFsbCBxdWV1ZXMg
aW4gc2ltcGxlIHJvdW5kLXJvYmluIGZhc2hpb24uIEZvciBoYXJkd2FyZQo+ID4gSW1wbGVtZW50
YXRpb24gd2l0aCBmaXhlZCBldmVudCB0eXBlIHRvIGludGVycnVwdCB2ZWN0b3IgYXNzaWdubWVu
dAo+ID4gSVZFQyBXQVJMIHByb3BlcnR5IGlzIHVzZWQgdG8gZGlzY292ZXIgc3VjaCBtYXBwaW5n
cy4KPiA+Cj4gPiBBZGRyZXNzIHRyYW5zbGF0aW9uLCBjb21tYW5kIGFuZCBxdWV1ZSBmYXVsdCBo
YW5kbGluZyBpbiB0aGlzIGNoYW5nZQo+ID4gaXMgbGltaXRlZCB0byBzaW1wbGUgZmF1bHQgcmVw
b3J0aW5nIHdpdGhvdXQgdGFraW5nIGFueSBhY3Rpb24uCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEx1
IEJhb2x1IDxiYW9sdS5sdUBsaW51eC5pbnRlbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBM
aSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5hY2gg
PHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvaW9tbXUvcmlzY3Yv
aW9tbXUtYml0cy5oIHwgIDc1ICsrKysrCj4gPiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5j
ICAgICAgfCA1MDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ID4gIGRyaXZlcnMv
aW9tbXUvcmlzY3YvaW9tbXUuaCAgICAgIHwgIDIxICsrCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA2
MDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IFsuLi5dCj4KPiA+ICsvKiBFbnF1
ZXVlIGFuIGVudHJ5IGFuZCB3YWl0IHRvIGJlIHByb2Nlc3NlZCBpZiB0aW1lb3V0X3VzID4gMAo+
ID4gKyAqCj4gPiArICogRXJyb3IgaGFuZGxpbmcgZm9yIElPTU1VIGhhcmR3YXJlIG5vdCByZXNw
b25kaW5nIGluIHJlYXNvbmFibGUgdGltZQo+ID4gKyAqIHdpbGwgYmUgYWRkZWQgYXMgc2VwYXJh
dGUgcGF0Y2ggc2VyaWVzIGFsb25nIHdpdGggb3RoZXIgUkFTIGZlYXR1cmVzLgo+ID4gKyAqIEZv
ciBub3csIG9ubHkgcmVwb3J0IGhhcmR3YXJlIGZhaWx1cmUgYW5kIGNvbnRpbnVlLgo+ID4gKyAq
Lwo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgcmlzY3ZfaW9tbXVfcXVldWVfc2VuZChzdHJ1Y3Qg
cmlzY3ZfaW9tbXVfcXVldWUgKnF1ZXVlLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2b2lkICplbnRyeSwgc2l6ZV90IGVudHJ5X3NpemUpCj4gPiArewo+ID4g
KyAgICAgdW5zaWduZWQgaW50IHByb2Q7Cj4gPiArICAgICB1bnNpZ25lZCBpbnQgaGVhZDsKPiA+
ICsgICAgIHVuc2lnbmVkIGludCB0YWlsOwo+ID4gKyAgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
PiA+ICsKPiA+ICsgICAgIC8qIERvIG5vdCBwcmVlbXB0IHN1Ym1pc3Npb24gZmxvdy4gKi8KPiA+
ICsgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKPiA+ICsKPiA+ICsgICAgIC8qIDEuIEFsbG9j
YXRlIHNvbWUgc3BhY2UgaW4gdGhlIHF1ZXVlICovCj4gPiArICAgICBwcm9kID0gYXRvbWljX2lu
Y19yZXR1cm4oJnF1ZXVlLT5wcm9kKSAtIDE7Cj4gPiArICAgICBoZWFkID0gYXRvbWljX3JlYWQo
JnF1ZXVlLT5oZWFkKTsKPiA+ICsKPiA+ICsgICAgIC8qIDIuIFdhaXQgZm9yIHNwYWNlIGF2YWls
YWJpbGl0eS4gKi8KPiA+ICsgICAgIGlmICgocHJvZCAtIGhlYWQpID4gcXVldWUtPm1hc2spIHsK
PiA+ICsgICAgICAgICAgICAgaWYgKHJlYWR4X3BvbGxfdGltZW91dChhdG9taWNfcmVhZCwgJnF1
ZXVlLT5oZWFkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhlYWQs
IChwcm9kIC0gaGVhZCkgPCBxdWV1ZS0+bWFzaywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAwLCBSSVNDVl9JT01NVV9RVUVVRV9USU1FT1VUKSkKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICBnb3RvIGVycl9idXN5Owo+ID4gKyAgICAgfSBlbHNlIGlmICgocHJvZCAt
IGhlYWQpID09IHF1ZXVlLT5tYXNrKSB7Cj4gPiArICAgICAgICAgICAgIGNvbnN0IHVuc2lnbmVk
IGludCBsYXN0ID0gUV9JVEVNKHF1ZXVlLCBoZWFkKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAg
aWYgKHJpc2N2X2lvbW11X3JlYWRsX3RpbWVvdXQocXVldWUtPmlvbW11LCBRX0hFQUQocXVldWUp
LCBoZWFkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAh
KGhlYWQgJiB+cXVldWUtPm1hc2spICYmIGhlYWQgIT0gbGFzdCwKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCwgUklTQ1ZfSU9NTVVfUVVFVUVfVElNRU9V
VCkpCj4gPiArICAgICAgICAgICAgICAgICAgICAgZ290byBlcnJfYnVzeTsKPiA+ICsgICAgICAg
ICAgICAgYXRvbWljX2FkZCgoaGVhZCAtIGxhc3QpICYgcXVldWUtPm1hc2ssICZxdWV1ZS0+aGVh
ZCk7Cj4gPiArICAgICB9Cj4gPiArCj4gPiArICAgICAvKiAzLiBTdG9yZSBlbnRyeSBpbiB0aGUg
cmluZyBidWZmZXIuICovCj4gPiArICAgICBtZW1jcHkocXVldWUtPmJhc2UgKyBRX0lURU0ocXVl
dWUsIHByb2QpICogZW50cnlfc2l6ZSwgZW50cnksIGVudHJ5X3NpemUpOwo+ID4gKwo+ID4gKyAg
ICAgLyogNC4gV2FpdCBmb3IgYWxsIHByZXZpb3VzIGVudHJpZXMgdG8gYmUgcmVhZHkgKi8KPiA+
ICsgICAgIGlmIChyZWFkeF9wb2xsX3RpbWVvdXQoYXRvbWljX3JlYWQsICZxdWV1ZS0+dGFpbCwg
dGFpbCwgcHJvZCA9PSB0YWlsLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCBS
SVNDVl9JT01NVV9RVUVVRV9USU1FT1VUKSkKPiA+ICsgICAgICAgICAgICAgZ290byBlcnJfYnVz
eTsKPiA+ICsKPiA+ICsgICAgIC8qIDUuIENvbXBsZXRlIHN1Ym1pc3Npb24gYW5kIHJlc3RvcmUg
bG9jYWwgaW50ZXJydXB0cyAqLwo+ID4gKyAgICAgZG1hX3dtYigpOwo+ID4gKyAgICAgcmlzY3Zf
aW9tbXVfd3JpdGVsKHF1ZXVlLT5pb21tdSwgUV9UQUlMKHF1ZXVlKSwgUV9JVEVNKHF1ZXVlLCBw
cm9kICsgMSkpOwo+Cj4gUGxlYXNlIGV4cGxhaW4gd2h5IGEgZG1hX3dtYigpIGlzIHN1ZmZpY2ll
bnQgdG8gb3JkZXIgdGhlIG1lbWNweSgpIHN0b3Jlcwo+IGJlZm9yZSB0aGUgdGFpbCB1cGRhdGUu
Cj4KClRoYW5rcywgY29tbWVudCBhZGRlZCBpbiB2MTAKCj4gPiArICAgICBhdG9taWNfaW5jKCZx
dWV1ZS0+dGFpbCk7Cj4KPiBJIHRoaW5rIHRoaXMgY2FuIGJlIHJlb3JkZXJlZCBiZWZvcmUgdGhl
IHJlbGF4ZWQgTU1JTyB3cml0ZSB0byB0YWlsLAo+IGNhdXNpbmcgb3RoZXIgQ1BVcyB0byBleGl0
IHRoZWlyIHBvbGxpbmcgZWFybHkuCj4KClZlcnkgdmFsaWQgcG9pbnQsIHRoYW5rIHlvdSEgU2hv
dWxkIGJlIGZpeGVkIGluIHYxMAoKQmVzdCwKLSBUb21hc3oKCj4gV2lsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
