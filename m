Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE80C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 19:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQOKbm03C9e+GII5tfzrnUw0ngFBMXdMHigUVfJJmoI=; b=YY/PHnRj7GkOl6
	kcQnRMZ1e7gYcrCmrktUXR+ZFEtAazAnJYmUk2BOYLqzOctBNw5+4hdD7eN4hjNVAN4wDVYNeeQZy
	ShLVfmVKCvnlThKfl2UMMG2tIfT9wNGYg2pltq/sHtRHe6ReSIAjJ/Gdu6mPLVkLIVNjodl+WAmd8
	jbLED5cw5auDVh0Z8dHSje9XeYWxfTEl0wSjj/b0oFMzhUB80UuQ6+MM72kkFAKB0p17T0CyNGI5/
	4H+sXW+Mu7WktsqKzETEAfA/h3TzC4CiIq3t5AbhFHOZt0ZTV0pnBWfvQeaV/Wz434N0Gy6p+Dlt/
	O+yVXY5NwJQBij2IwfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwWQ-00000007Leo-1ofr;
	Wed, 05 Jun 2024 19:42:10 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEwWN-00000007LeE-2Bzk
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 19:42:09 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2c2283707b3so182903a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717616525; x=1718221325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Iqln3pU608Iw9vzO5mExR0F6HHdjBJu68DaW17wMtg=;
        b=dhn4dYAeQi5fQgxbvZcYzeE3Bm9EfXd8BnUnYqC+YHd+OZXeuU0YRZOfD4JyKdWb/c
         CLPashk+08RgYrw9Qi8KIHrQ6cJt1CsaoAD6ZvuH5M51+n6IkHbzdfUgCPv3oYth3Lox
         EPNrIGdLhli++gE/NghHLJiRdCWuLV8jMNG22hOR1rehVWp3vckqGguuV62mKs3b8+lF
         R1mhTHtHcJhh+WR/U3GGVpiHrLFkx6d1tcDuFMxTSUC4Z88JNB3faylQgDp6cSZ3N2AJ
         dSV+Le9FJEM2bhPjuGWhxpAfapKs5w3/BkY7EBlnAXEAQHfh0uL50EViIgJYS5k9+mby
         pvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717616525; x=1718221325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Iqln3pU608Iw9vzO5mExR0F6HHdjBJu68DaW17wMtg=;
        b=tkdFynDtNmBCgR4gBqsBoEUoUFiJdAyKKO4hijXBU9emfJYvj2Pqg6iAv+Nqwf/yHS
         32y9ebjxzrz+9ZbVXDtprlfChvCgfcneklM9hA0Mq0eX0VggeeECFVPFk50ERWz1LA63
         XJdzM/Yf8jArfAHnd6rhGajTV5HQowcd+n/kbiZfa4CPuq1iJmyfwhSV1rWOoeOxCh6h
         UAWLUA5I+ytT4JTDHxb8YBIbL+/w8mf6HKmpRxksc0XEOigCMZVflNfiWJ+udPHXFDRo
         hqrMVobkAL16z2in8UpZ5L2aw30Jw7hAMzN306LdopcfUyRZwHRA1cdjYWq5bw88Ki4i
         ifgw==
X-Forwarded-Encrypted: i=1; AJvYcCV55uJ7s2JMUFA/a/goYqPtDVIBl6KB1xLflOugC6EJvr85XPys+3cUf/YduNbR37XFFUffAKDZ/qITSKFG7DNmjTYGpy0VaxT+8xjEHdwh
X-Gm-Message-State: AOJu0Yx10Juu25u/2LORGVX/UOBTJ+ziVLjdrad01r/CgXaRdzYOilAh
	oWXkzdZx6ql71IwZ1wsh7C50gG0tNedzbuOO3o74pQyFQABI6PrVUrRG4Bnf0oGg4PFxabic+4V
	gyNY/LeiZEbLbPqXncOctLxskGYo8yVsxiD1SCw==
X-Google-Smtp-Source: AGHT+IFxkkjp3fqK9lU0wtMgPlDRTY2Cd2wIkY8GxicXToEgBWVNk+WJY3GzgNmNfvvI5PceIdD3ucHY/8b9z28EL74=
X-Received: by 2002:a17:90a:b297:b0:2c1:948b:6f2c with SMTP id
 98e67ed59e1d1-2c27db5ce10mr3938026a91.39.1717616525310; Wed, 05 Jun 2024
 12:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1716578450.git.tjeznach@rivosinc.com> <7dcd9a154625704cbf9adc4b4ac07ca0b9753b31.1716578450.git.tjeznach@rivosinc.com>
 <20240603-d622cdac0016f1f854bf2b4c@orel>
In-Reply-To: <20240603-d622cdac0016f1f854bf2b4c@orel>
From: Tomasz Jeznach <tjeznach@rivosinc.com>
Date: Wed, 5 Jun 2024 12:41:53 -0700
Message-ID: <CAH2o1u4mU2fs7p+J7pqeBSRRPb1SFZh=8UXzXCsJneTHMxVVgw@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] iommu/riscv: Add RISC-V IOMMU platform device driver
To: Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_124207_588620_094C39C8 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKdW4gMywgMjAyNCBhdCA1OjU54oCvQU0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAyNCwgMjAyNCBhdCAxMjozNDo0
MlBNIEdNVCwgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gLi4uCj4gPiArc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgcmlzY3ZfaW9tbXVfcGxhdGZvcm1fZHJpdmVyID0gewo+ID4gKyAgICAg
LnByb2JlID0gcmlzY3ZfaW9tbXVfcGxhdGZvcm1fcHJvYmUsCj4gPiArICAgICAucmVtb3ZlX25l
dyA9IHJpc2N2X2lvbW11X3BsYXRmb3JtX3JlbW92ZSwKPgo+IEhpIFRvbWFzeiwKPgo+IEkgdGhp
bmsgd2Ugc2hvdWxkIGFsc28gc3VwcG9ydCAuc2h1dGRvd24gKGp1c3QgdHVybiB0aGUgSU9NTVUg
b2ZmPyksCj4gb3RoZXJ3aXNlIHRoZSBJT01NVSBkcml2ZXIgcmVwb3J0cyBFQlVTWSBhbmQgZmFp
bHMgdG8gaW5pdGlhbGl6ZSB3aGVuCj4gcmVib290aW5nLgo+Cj4gU2FtZSBjb21tZW50IGZvciB0
aGUgUENJIGRyaXZlci4KPgoKSSd2ZSBiZWVuIHRlc3RpbmcgcGF0Y2hlcyB3aXRoIGFkZGVkIHNo
dXRkb3duIGhhbmRsZXJzLCBhbHNvIGxvb2tpbmcKYXQgcmVib290IG5vdGlmaWVyIGhvb2tzLiBJ
biBib3RoIGNhc2VzLCBkZXZpY2VzIGFjdGl2ZWx5IHJ1bm5pbmcgRE1BCnRyYWZmaWMgYXQgc3lz
dGVtIHNodXRkb3duIChlZy4gc3RvcmFnZSkgbWlnaHQgYmUgYWZmZWN0ZWQgYnkKdG9vLWVhcmx5
IElPTU1VIGRpc2FibGUgY2FsbC4gVGhpcyB0b3BpYyB3YXMgYWxyZWFkeSBicm91Z2h0IHVwIGlu
IHRoZQpkaXNjdXNzaW9uIFsxXSBhYm91dCBrZXhlYyByZWJvb3QgZmxvdy4KCkluIHRoaXMgc2Vy
aWVzIEknZCBwcmVmZXIgdG8ga2VlcCB0aGUgSU9NTVUgYWN0aXZlIGR1cmluZyBzaHV0ZG93biwK
YW5kIHByZXBhcmUgdGhlIFJJU0MtViBJT01NVSBzaHV0ZG93biBzZXF1ZW5jZSBpbXBsZW1lbnRh
dGlvbiBhcyBhCnNlcGFyYXRlIHNlcmllcywgYXMgaXQgd2lsbCBpbnZvbHZlIG1vcmUgcmlzYy12
IHJlYm9vdCByZXdvcmsgdG8KZ3VhcmFudGVlIG9yZGVyaW5nIG9mIHRoZSBzaHV0ZG93biBjYWxs
YmFja3MuIEluIGEgbm9ybWFsIHJlYm9vdApjeWNsZSwgZmlybXdhcmUvaGFyZHdhcmUgcmVzZXQg
c2hvdWxkIGJyaW5nIElPTU1VIHRvIGtub3duCm91dC1vZi1yZXNldCBzdGF0ZSBhbnl3YXkuCgpb
MV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUvMDU5YWU1MTYtYWVkNC00ODM2
LWEyY2EtYWZmMTUwZmY0MjhkQGFybS5jb20vCgpCZXN0LAotIFRvbWFzegoKPiBUaGFua3MsCj4g
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
