Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E690EC001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 16:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2p+6PhImrR2xO/OjJwfbphdD7VDPrnihd10SMMHagk=; b=FL/tC4prNs6nFo
	f+IjDT7OMNeim2nmAPUeACbXvAP5oINsMuyVaZFPdTnC02yhHexTuUgo4nfqDIRUFYK+ZS8ox9JzG
	57U5y8M4UAMm86UshIoSSpcabo4M+rcvRDC8mQRGgkbHjwBLQs7fgHqvz1IIrp85NiLxQy7r+fbXZ
	7ySCrwNngOq6VY5L05HLRErN1tc1aQsLXyzfZ06Dz9Dav3+nIuokEGpEp4U2RW1/gG6U+AquGBEnx
	4fb/stc8rJRSuDsEKcERFW5qeYnkxk5S6OCjVZlNTycTX6KpTGfa2TpIrEf1X2mpm0H9nktTLpX3O
	OpBdoAQJ7vbsFZ9JFO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPYZ-002ygp-10;
	Tue, 08 Aug 2023 16:27:39 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTPYX-002ygM-00
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 16:27:38 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-63d1238c300so29425636d6.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691512050; x=1692116850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JoWzrCMANPjnlj2cvgK7d043Ga9JDouQ0JU9bziv+Vs=;
        b=aoX21WBggS/4XosYG0HYLIKnJ7c7QmjOo9JOVS5jS9Qk8gIoraTfS8Lb4jlP3ng4/S
         nctO0uW56++SiRwWIDxn2eqcf67alPUNwPhsVpCQQ3TTyccURL0mUptq2wWAUFptt1GL
         hlj8Q50IjofgrBXgbY9XAQgzJuvg8mjfos48sd3VRUSPz9IHKk3XE/2y/zQMdLFFbHU2
         cjJXk0bdZIO/QTUJvDiTUZNMGazUTawXnhvtWaqSWI+idWPmzPVMXpZ6zO5mVfh7TDmf
         o+2EFmlEPQkzUioTfn9saJw+QvTfEUkoVRdA6mYqAyVyJmZsTRmt/WPFWkzLZBD+ByzQ
         bHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512050; x=1692116850;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JoWzrCMANPjnlj2cvgK7d043Ga9JDouQ0JU9bziv+Vs=;
        b=kvZ2urGQt0Dha6wMqDS41TsUxXOhAm5h67M0ab/HKnJthVNOke2RAqw4JuDGlUKi3Z
         8K3Mr1WxIpz+WzwLHMiuMiyk5uxhNKAJI7puC21WExoE5mJ7j0KqMxenXcyI4lpOJLem
         Ngptjz92o4q2WF4/MQTuPbEoY+e5GsXL3LpwvB80fa3bNB/Nj51xQaU73oSnkr2GDjyy
         EH8WygIwGRbGnqkqD1dexZNojwsIKHkNUC7d2A7BsvSXpGPpTMN7L0TNlyYfYEVfGkhf
         OCGRCPFFRT8snCrXzIoAyqJf/OsIExSwu2ABlZHvojrB+8dEOkomhn+T3FzLcWd58uBA
         N17Q==
X-Gm-Message-State: AOJu0Ywj/uwbnVb+AZiUWDLBw/MPNerZJc6Q4KoKnOeqqvw+k5st6Acf
	ogzByUDBlmI2F4ckTEiHgXO6me2sY+7Zl5eciGf0Kw==
X-Google-Smtp-Source: AGHT+IFE1mPg+bhXgiG77u3yQqApnKpoE4FunmLDF9Q9WwsTSf+Qi6ptI0RPfwZ4AzBJM8DZgQeG+mmHAo9n23G6KkM=
X-Received: by 2002:a0c:dd13:0:b0:63c:fb87:625d with SMTP id
 u19-20020a0cdd13000000b0063cfb87625dmr10181036qvk.3.1691512050315; Tue, 08
 Aug 2023 09:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230808-riscv_static-v1-1-9f3dc99dafe8@google.com> <20230808162412.GA2172017@dev-arch.thelio-3990X>
In-Reply-To: <20230808162412.GA2172017@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 8 Aug 2023 09:27:19 -0700
Message-ID: <CAKwvOd=93QE6d1Runn9EO9A4KBAKvhx4RwZTpWNNFcf2eW1kWQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: mm: fix 2 instances of -Wmissing-variable-declarations
To: Nathan Chancellor <nathan@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Tom Rix <trix@redhat.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_092737_039250_007D1C12 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBBdWcgOCwgMjAyMyBhdCA5OjI04oCvQU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDA4LCAyMDIzIGF0IDA5OjE1OjQx
QU0gLTA3MDAsIE5pY2sgRGVzYXVsbmllcnMgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFi
bGUuaAo+ID4gaW5kZXggNzU5NzBlZTJiZGEyLi40YzhjMGY4M2E5NzQgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IEBAIC0xODgsNiArMTg4LDcgQEAgZXh0ZXJuIHN0cnVj
dCBwdF9hbGxvY19vcHMgcHRfb3BzIF9faW5pdGRhdGE7Cj4gPiAgI2RlZmluZSBQQUdFX0tFUk5F
TF9JTyAgICAgICAgICAgICAgIF9fcGdwcm90KF9QQUdFX0lPUkVNQVApCj4gPgo+ID4gIGV4dGVy
biBwZ2RfdCBzd2FwcGVyX3BnX2RpcltdOwo+ID4gK2V4dGVybiBwZ2RfdCB0cmFtcG9saW5lX3Bn
X2RpcltdOwo+Cj4gTWlzc2luZyBlYXJseV9wZ19kaXIgdG9vPyBJdCBsb29rcyBsaWtlIHRoZXJl
IGlzIGFscmVhZHkgYSBkZWNsYXJhdGlvbgo+IGluIGFyY2gvcmlzY3YvbW0va2FzYW5faW5pdC5j
IHRoYXQgY291bGQgYmUgaG9pc3RlZCBoZXJlPwoKWWVwLCB3aWxsIHJlc3Bpbi4gR29vZCBjYXRj
aCEKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
