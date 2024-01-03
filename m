Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0349DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5oq8aN6otm5oBTlVyQo5qaj1ZUYU8or/4Ea6oSPIJw=; b=jQsCD7NyML8vMa
	80qFvEUwWri41xi46a/jrH8nxxstpVt9uviofFnYTtEXOZvwqtD7hGZmdUVIDA/WBGqvIELxWAHum
	SdOtNaoJD54+srdYGpdqhTq7EkY6jdJzFbIqzoQaw8+V9EN6nSPqxC9wDtlSfdvzU02xuO0P6IhJA
	0sHh+zyONEEFBBX5Lsrl1o3ZYzVecoIRVt53rxdE7l1VX8QBZPy3ISgdua7V5Q7y/gF8HRbRCsztM
	49Z4IUkSaf8zcBDmb0e7vdJD19dAF4oU5PcueLSpj4C6ampfPCGVkz/CAz1093hkhxHLzsgGZ8Fg7
	IBpUOuMcVEq5+cbRszdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6Xh-00Brce-0a;
	Wed, 03 Jan 2024 19:04:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6Xe-00Brbv-1S
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704308677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Sk8miiHF/d2ya2q7kYXl8D7bd/oZPlQyy/ElPudR44=;
	b=Y+A0L8y7OyE3Oz9ubJGFQ/BxYPgf0iU0EenjVGcCRS7RO0MiLB/tCX92su9wTaR3KWujzP
	1YZ2rvEES8K/vl6G0P/1KdKgqawCF/hjq/VDXHyDcdDxle83Ekat+VLacyADcJG28LfugK
	EOon8lAR3RLh8sq7Uze77E9YLCue9X0=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-uK34CQiVPdiJ_TDmhRr8xg-1; Wed, 03 Jan 2024 14:04:35 -0500
X-MC-Unique: uK34CQiVPdiJ_TDmhRr8xg-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d409124358so51259105ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:04:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704308674; x=1704913474;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Sk8miiHF/d2ya2q7kYXl8D7bd/oZPlQyy/ElPudR44=;
        b=Zkb5zcORBnd5EYXPDBg2JexFxosuiGq4mfsuBW/mFh0Z2otu5OldsgOdRrMKmUHHgG
         9NR+G4srjFlWBt46mGuJ4vMO6FEj1RTno5y27hK5TS8CRaBR9ZWC0vFjH4JgccmoyRsc
         ZktnCrRUWa0nqTjGLIDsf+gl0GWmhBbvIumcw7D7/2z681pPESq6x3PpQA3m+Y/sMyeD
         5Uz8xfdJAZNojgv2vKTbvrsCesw+rbgmmIWNmlAdg2hm0u8WSMT/GwzglmLn9AQ7mqlg
         KzuhDdiw1z3vX0+sLoZa01X4LuhtWsodaTCWFVm+cIGIoOUmKiJhghpsCKD0oIcIGBNa
         V/hg==
X-Gm-Message-State: AOJu0Yza60Fq+VbUWibeoQoE9r4u/kYDj5x3J2byZVI9EkAaSfMbOjUP
	nPuNHHi6XLjyLAGSEzpPGUE5+4YGF0wnwihK4NRLUKNeao6Ktu3eFwLo3mOFMIR00Fg0v6IVYck
	U3JfTv0XhxT4Cw52wDiwJ3BhzHj3zYlmp2i6N
X-Received: by 2002:a17:903:1251:b0:1d3:b308:ad9c with SMTP id u17-20020a170903125100b001d3b308ad9cmr9386192plh.80.1704308673988;
        Wed, 03 Jan 2024 11:04:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPHqiwKr7qkMiDorzX91GY7F09uOlrak6QKhMSD7AKHawP9SCvQwH7Z+HT1U6vepc4nhnGuw==
X-Received: by 2002:a17:903:1251:b0:1d3:b308:ad9c with SMTP id u17-20020a170903125100b001d3b308ad9cmr9386167plh.80.1704308673715;
        Wed, 03 Jan 2024 11:04:33 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902e88f00b001d4c955cc00sm3410994plg.271.2024.01.03.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:04:32 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
Date: Wed,  3 Jan 2024 16:04:20 -0300
Message-ID: <ZZWvtFaF5KPLt8Aw@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJF2gTTZeN+rfG6szdB+J1QySQ2tAadwpG_zt2cRir7Bn+Yh4g@mail.gmail.com>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-3-guoren@kernel.org> <CAJF2gTTZeN+rfG6szdB+J1QySQ2tAadwpG_zt2cRir7Bn+Yh4g@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_110438_554143_25CC4CAF 
X-CRM114-Status: GOOD (  19.88  )
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
Cc: wefu@redhat.com, keescook@chromium.org, ajones@ventanamicro.com, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMDEsIDIwMjQgYXQgMTA6Mjk6MjFBTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBTdW4sIERlYyAzMSwgMjAyMyBhdCA0OjMw4oCvUE0gPGd1b3JlbkBrZXJuZWwub3JnPiB3
cm90ZToKPiA+Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4g
Pgo+ID4gRW5hYmxlIExpbnV4IHByZWZldGNodyBwcmltaXRpdmUgd2l0aCBaaWJvcCBjcHVmZWF0
dXJlLCB3aGljaCBwcmVsb2Fkcwo+ID4gY2FjaGUgbGluZSBpbnRvIEwxIGNhY2hlIGZvciB0aGUg
bmV4dCB3cml0ZSBvcGVyYXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nv
ci5oIHwgMTYgKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRp
b25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gPiBpbmRleCBmMTlm
ODYxY2RhNTQuLjhkM2EyYWIzNzY3OCAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vcHJvY2Vzc29yLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vz
c29yLmgKPiA+IEBAIC0xMyw2ICsxMyw5IEBACj4gPiAgI2luY2x1ZGUgPHZkc28vcHJvY2Vzc29y
Lmg+Cj4gPgo+ID4gICNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9p
bnNuLWRlZi5oPgo+ID4gKyNpbmNsdWRlIDxhc20vYWx0ZXJuYXRpdmUtbWFjcm9zLmg+Cj4gPiAr
I2luY2x1ZGUgPGFzbS9od2NhcC5oPgo+ID4KPiA+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiAg
I2RlZmluZSBERUZBVUxUX01BUF9XSU5ET1cgICAgIChVTCgxKSA8PCAoTU1BUF9WQV9CSVRTIC0g
MSkpCj4gPiBAQCAtMTA2LDYgKzEwOSwxOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF90aHJl
YWRfc3RydWN0X3doaXRlbGlzdCh1bnNpZ25lZCBsb25nICpvZmZzZXQsCj4gPiAgI2RlZmluZSBL
U1RLX0VJUCh0c2spICAgICAgICAgICh0YXNrX3B0X3JlZ3ModHNrKS0+ZXBjKQo+ID4gICNkZWZp
bmUgS1NUS19FU1AodHNrKSAgICAgICAgICAodGFza19wdF9yZWdzKHRzayktPnNwKQo+ID4KPiA+
ICsjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9aSUNCT1AKPiA+ICsjZGVmaW5lIEFSQ0hfSEFTX1BS
RUZFVENIVwo+ID4gKwo+ID4gKyNkZWZpbmUgUFJFRkVUQ0hXX0FTTSh4KSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICBBTFRFUk5BVElW
RShfX25vcHMoMSksIENCT19QUkVGRVRDSF9XKHgsIDApLCAwLCAgICAgICAgICAgICAgICAgXAo+
ID4gKyAgICAgICAgICAgICAgICAgICBSSVNDVl9JU0FfRVhUX1pJQ0JPUCwgQ09ORklHX1JJU0NW
X0lTQV9aSUNCT1ApCj4gVGhlIFBSRUZFVENIV19BU00oeCkgZGVmaW5pdGlvbiBzaG91bGQgYmUg
b3V0IG9mICJpZmRlZgo+IENPTkZJR19SSVNDVl9JU0FfWklDQk9QLi4uICNlbmRpZiIsIGJlY2F1
c2UgeGNoZ19zbWFsbCBtYXkgdXNlIHRoaXMKPiBtYWNybyB3aXRob3V0IENPTkZJR19SSVNDVl9J
U0FfWklDQk9QLgo+IAoKQWdyZWUgOikKCj4gPiArCj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2
b2lkIHByZWZldGNodyhjb25zdCB2b2lkICp4KQo+ID4gK3sKPiA+ICsgICAgICAgX19hc21fXyBf
X3ZvbGF0aWxlX18oUFJFRkVUQ0hXX0FTTSglMCkgOiA6ICJyIiAoeCkgOiAibWVtb3J5Iik7Cj4g
PiArfQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfUklTQ1ZfSVNBX1pJQ0JPUCAqLwo+ID4KPiA+ICAv
KiBEbyBuZWNlc3Nhcnkgc2V0dXAgdG8gc3RhcnQgdXAgYSBuZXdseSBleGVjdXRlZCB0aHJlYWQu
ICovCj4gPiAgZXh0ZXJuIHZvaWQgc3RhcnRfdGhyZWFkKHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+
ID4gLS0KPiA+IDIuNDAuMQo+ID4KPiAKPiAKPiAtLSAKPiBCZXN0IFJlZ2FyZHMKPiAgR3VvIFJl
bgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
