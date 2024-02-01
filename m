Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCFC47258
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 02:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOnJ4l/9MDYNcUE2U2S+0IPbNsyWOrBhMaaNomYuW90=; b=kxD1SF/IvmflkG
	Vb+gvjh3/hX5KMhKh6Ttw0YjyypuPqQu1UhlH8xnBgTM1c6Y5kQKXBaDs6BBXdsmu4C2PoeMXbseW
	Lky08hTyRN9sg7ehObVtcfMglfRo0pDOE5slWXVrUJFWBpRyud6oTltd3YIAxv7n9bCdyv1kMsN1G
	voHXTK4ZJEIVXIDN7in7MrpNHB0Iu7W4cOosL1W8D2tpgK9xJ7UGHB4BpovoRDKjGSXpzFkCaP1F5
	mfny3/+RrIsFZu9N7mT+uXG4q7zz6yF8fq0BVGGJOd++YhSKRPr+B412CB5kZTEMbKiY8zsf/Bw63
	SXaEXflxmPExI1lr/N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVNIC-00000006Kxc-1qkw;
	Thu, 01 Feb 2024 02:59:08 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVNIA-00000006KxA-1FH9
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 02:59:07 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-510322d5363so633591e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jan 2024 18:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706756343; x=1707361143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CpLZHn3p6Y5uqROAkr3ACzV/aHb9p+4CqdQVObwG5g=;
        b=eCfSq0E3hB9R3CkJfa6X4v9MhcD34e5+GbJHm2oCPaTGeUTBYPQ9b37zOgnYDWKNK6
         OYOK1xQyi8IzxMQAOMqvi0jWWZ3UYi++tDnLnWv5OkR3L1QsP5vUv6bZEYx2Ds4Ra8Pk
         83GoaiuKzhGdE/ATWW/VFw1d87g5XllK8cy4WNLB/kqqWmcHxTk0eaVC+6WfUNRpSr/X
         zvfIdggq+jYNOrtsSvM5ckzoJcABZQmVruGFpwQTWBvJgoLOyJGjCCUo/BPdCspz09HC
         iO+GDNtFJ7YCYoNE6iOF8Ls90vYH2//rFWR02ZH3kVnIomv9HGaOnFNy3/DjIG82RGaD
         vzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706756343; x=1707361143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CpLZHn3p6Y5uqROAkr3ACzV/aHb9p+4CqdQVObwG5g=;
        b=BEvP0TI2C0b+0mRJ+qvGuhlE8SFQylte2J757EwifL6o8BT/1gBlocbf5x6hzZKJwd
         SW3LhgoFnztx7hi4cdkvSBlqcP7SF3z33eYA+3ydWh9MKw0D613d2nTvwF6AU8noNnuW
         2vsm+RQnc1700URi5d5iN0m/r4Ry/hckdqg7X4Z+/AS7El6ElmKqv4sK3lBdAIwLXDG/
         JgRIBz0bBnqbn2K8EoqhpXIF72WNckVOGwmvRWgZg+wpFDAVC1EN0Rj6vNrrkybeVd6O
         +DSV71mC9/CbBr5VN4MZnaNZ7BQ5K2up93erLDdmzqOr4/Gkh/GoLAtAeH6WODC2qAYp
         axqw==
X-Gm-Message-State: AOJu0YwYzXCIoZ52PKckKCcWrrKptgP3WRqTLucKgr+mwLuB0qnOKECc
	blwT8AKn4iYwAip2xaXGFtL8KpTqr7LOGxHyIDuSjSgtBWlHm6HXDBbMh17XfjPn2Enc9pI5cLE
	cddQMeo0zlfiNHndgnEZmt1iClTk=
X-Google-Smtp-Source: AGHT+IFqBWvZMFSoe1kdbaLQ4YMXumTydevNBtADzyVBBimPtohOhhboE3z66Jft4SF2LF6fmofYSXZ8L/E6AOgsCdI=
X-Received: by 2002:a05:6512:3d04:b0:511:2e99:c03 with SMTP id
 d4-20020a0565123d0400b005112e990c03mr439801lfv.8.1706756342679; Wed, 31 Jan
 2024 18:59:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1706603678.git.haibo1.xu@intel.com> <0be49d4d7d7e43933534aad6f72b35d3380519fd.1706603678.git.haibo1.xu@intel.com>
 <682f037e-0efe-4d73-b867-f1f86a244836@app.fastmail.com>
In-Reply-To: <682f037e-0efe-4d73-b867-f1f86a244836@app.fastmail.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Thu, 1 Feb 2024 10:58:51 +0800
Message-ID: <CAJve8okV_9qs6urESw2N-v8LT2-QP40jc1WhHYci7n-r9EoA9Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] ACPI: RISCV: Enable ACPI based NUMA
To: Arnd Bergmann <arnd@arndb.de>
Cc: Haibo Xu <haibo1.xu@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, "Conor.Dooley" <conor.dooley@microchip.com>, 
	guoren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
	James Morse <james.morse@arm.com>, linux-riscv@lists.infradead.org, 
	Ard Biesheuvel <ardb@kernel.org>, Baoquan He <bhe@redhat.com>, acpica-devel@lists.linux.dev, 
	Robert Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Dan Williams <dan.j.williams@intel.com>, 
	Chen Jiahao <chenjiahao16@huawei.com>, Yuntao Wang <ytcoode@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Tony Luck <tony.luck@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Samuel Holland <samuel.holland@sifive.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_185906_354704_15834E3F 
X-CRM114-Status: GOOD (  16.61  )
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

T24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNTozM+KAr1BNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJu
ZGIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMzEsIDIwMjQsIGF0IDAzOjMyLCBIYWlibyBY
dSB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnIGIvZHJp
dmVycy9hY3BpL251bWEvS2NvbmZpZwo+ID4gaW5kZXggODQ5YzJiZDgyMGI5Li41MjUyOTdjNDQy
NTAgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnCj4gPiArKysgYi9k
cml2ZXJzL2FjcGkvbnVtYS9LY29uZmlnCj4gPiBAQCAtMiw3ICsyLDcgQEAKPiA+ICBjb25maWcg
QUNQSV9OVU1BCj4gPiAgICAgICBib29sICJOVU1BIHN1cHBvcnQiCj4gPiAgICAgICBkZXBlbmRz
IG9uIE5VTUEKPiA+IC0gICAgIGRlcGVuZHMgb24gKFg4NiB8fCBBUk02NCB8fCBMT09OR0FSQ0gp
Cj4gPiArICAgICBkZXBlbmRzIG9uIChYODYgfHwgQVJNNjQgfHwgTE9PTkdBUkNIIHx8IFJJU0NW
KQo+Cj4gVGhlIGRlcGVuZGVuY3kgaXMgbm8gbG9uZ2VyIG5lZWRlZCBub3cgc2luY2UgdGhlc2Ug
YXJlCj4gdGhlIGZvdXIgYXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQgQUNQSSBub3cgdGhhdCBJ
QTY0Cj4gaXMgZ29uZS4KPgo+IEFsbCBvZiB0aGVtIGFsc28gJ3NlbGVjdCBBQ1BJX05VTUEnIGJ5
IGRlZmF1bHQsIHRob3VnaCBvbgo+IHg4NiB0aGlzIGNhbiBzdGlsbCBiZSBkaXNhYmxlZCBieSBt
YW51YWxseSB0dXJuaW5nIG9mZgo+IENPTkZJR19YODZfNjRfQUNQSV9OVU1BLiBJIHN1c3BlY3Qg
d2UgZG9uJ3QgYWN0dWFsbHkgZXZlcgo+IHdhbnQgdG8gdHVybiBpdCBvZmYgb24geDg2IGVpdGhl
ciwgc28gSSBndWVzcyB0aGUgS2NvbmZpZwo+IG9wdGlvbiBjYW4ganVzdCBiZSByZW1vdmVkIGVu
dGlyZWx5Lgo+CgpHb29kIGNhdGNoISBXaWxsIHJldmVydCB0aGUgY2hhbmdlIGluIHRoZSBuZXh0
IHZlcnNpb24uCgpUbyByZW1vdmUgdGhlIGRlcGVuZGVuY3kgZW50aXJlbHksIEkgdGhpbmsgd2Ug
bmVlZCBhIHNlcGFyYXRlIHBhdGNoIGZvciBpdC4KV2hhdCdzIHlvdXIgb3Bpbmlvbj8KClJlZ2Fy
ZHMsCkhhaWJvCgo+ICAgICAgQXJuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
