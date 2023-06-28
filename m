Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAA7EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwhE2bs97aChusFg45lU32rgTv9N78SaU0Ao2bQw3jQ=; b=I2oEZahwjuPp5L
	GniAvBq40xVS1HvKBczLzpxAuCrtvbzzrrmF97ppWTrZ9dzWQZ24IYV935GEFWDV4vGSGGtUTQH3U
	+7wdf0dxSs7Wm9afZPBgbsl5Yv4iah485TDefZ/4FUtj7YLlwOTVKsZNd5QLnvRnHrIUTV4BXwFiR
	NKuolykjdzt4DO1lxzB864l+8q5UF0Ce71twBcrMkasgNV+3TZrGTAX5iw3jlUd5n7F3EjtQOMMRJ
	5IdNQ/ebz05f004gKen5y634qpwIXbmoz0IwazgDNegxOvc28U7TNOA/8QZ8bi82QIc9nlvJSKW+5
	cIxNO65Z5vDHSby4OEqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qERxu-00FIxy-2Q;
	Wed, 28 Jun 2023 09:59:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qERxq-00FIxM-2G
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 09:59:56 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-313e12db357so6005747f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jun 2023 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687946386; x=1690538386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtKFdqVLaSwnYyY9I8QOzCILW202QthGc5gJj1llyKw=;
        b=o4iDWEs+61QW05slbiKCk13Lv8rf7lTHCQQV46/s3ATenQeXbm8EM4S1OLUvOWrGV9
         9w7cItdCiIhRbgI6LgTqTiRTUG/cgOyAso6iccw8WYZiops+TNzcegGI2ijb9lLqabcn
         XE26qdQ1ZF/lh5EahJVSo8xW0uyNqKhDqVNVZYrhHmV/XM8w6Hqwm5YfzJEQFTOzyzxM
         yGfb9ru59Jfo85ur/iW4HyGdMGLRrcbg0byB8NNKj7jhWQhZx8t2nF0bHZ2jkQ7XhGUS
         i+0Z1wqCOnaKTsLX6unC/IDZNHY9BLqUnxDiJdI+o9bD3SnEuru2kl9ZhW0cSYYMLgXF
         4wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687946386; x=1690538386;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JtKFdqVLaSwnYyY9I8QOzCILW202QthGc5gJj1llyKw=;
        b=arNslSPPN4/Au8JXMxnRbYSpvFPKJ/RKVPHE/ShszSovnK802kNO4GHcjzHpYbBbkJ
         /uZn7uIjz+D5Ybp1uks2n6wLV4bylQDhNEaIieL/qJERgrfcUalcAAtbJKlyilIfj+4Z
         59f9VL2jWUGvNf8qE2wg8SADoYGXLNhMTVlukRsT8NhfnqwXmrj+ez5yVlVe5If4l7bd
         fQ/Mu7MFbz9F8LnLrstOnbNkwXjPaH14P8uSynEg99KKhqpR5JNfhpdeoFD2CkBlgvxW
         fxdtWR+/05Em50GsEW0OxeoFWvVZEVkHP6i+fDW4IBrE6ZU7Pf2VMcAyzyP739fnKTel
         bulA==
X-Gm-Message-State: AC+VfDx4froidJ012OwGZqW9JFhV7jh2BZ08OdCZ/B9r+kgTN3Ezovuo
	tz0Gqq6QO/NHvrpn9joNH61ikp4YuUENPpB59VxvTw==
X-Google-Smtp-Source: ACHHUZ4KPwDuPEzHggGf2J1dNOkOMwM93c3sV7GQHED5yGaUZQXVpC30d6ZPz0rbrzEYvrN9TWcevw==
X-Received: by 2002:adf:f44f:0:b0:314:37d:9899 with SMTP id f15-20020adff44f000000b00314037d9899mr4149402wrp.42.1687946385846;
        Wed, 28 Jun 2023 02:59:45 -0700 (PDT)
Received: from vermeer ([2a01:cb1d:81a9:dd00:b570:b34c:ffd4:c805])
        by smtp.gmail.com with ESMTPSA id a10-20020adfdd0a000000b0030af15d7e41sm13081542wrm.4.2023.06.28.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 02:59:45 -0700 (PDT)
Date: Wed, 28 Jun 2023 11:59:43 +0200
From: Samuel Ortiz <sameo@rivosinc.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: Conor Dooley <conor@kernel.org>, Evan Green <evan@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux@rivosinc.com, Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>, Atish Patra <atishp@rivosinc.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Jiatai He <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing from DT
Message-ID: <ZJwEj710jhXoKHfm@vermeer>
References: <20230627143747.1599218-1-sameo@rivosinc.com>
 <20230627143747.1599218-2-sameo@rivosinc.com>
 <CALs-HssMkVikspnEi-Ek2t=ABvFvgptAhsBjk1+aLuVjiP7P7w@mail.gmail.com>
 <20230627-debating-twelve-da2c1ed60948@spud>
 <ZJsyntnQ/FDXgNPk@Sun>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZJsyntnQ/FDXgNPk@Sun>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_025954_987335_B2FFB093 
X-CRM114-Status: GOOD (  32.34  )
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

T24gV2VkLCBKdW4gMjgsIDIwMjMgYXQgMDM6MDM6NThBTSArMDgwMCwgSG9uZ3JlbiAoWmVuaXRo
YWwpIFpoZW5nIHdyb3RlOgo+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDA3OjQ4OjE1UE0gKzAx
MDAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIzIGF0IDExOjE0
OjMwQU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgSnVuIDI3LCAyMDIz
IGF0IDc6MzjigK9BTSBTYW11ZWwgT3J0aXogPHNhbWVvQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4g
PiA+ID4KPiA+ID4gPiBGcm9tOiAiSG9uZ3JlbiAoWmVuaXRoYWwpIFpoZW5nIiA8aUB6ZW5pdGhh
bC5tZT4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggcGFyc2VzIFpiL1prIHJlbGF0ZWQgc3Ry
aW5nIGZyb20gRFQgYW5kCj4gPiAKPiA+ICVzL1RoaXMgcGF0Y2gvLwo+ID4gCj4gPiA+ID4gb3V0
cHV0IHRoZW0gaW4gY3B1aW5mbwo+ID4gPiA+Cj4gPiA+ID4gT25lIHRoaW5nIHdvcnRoIG5vdGlu
ZyBpcyB0aGF0IGlmIERUIHByb3ZpZGVzIHprLAo+ID4gPiA+IGFsbCB6YmtiLCB6YmtjLCB6Ymt4
IGFuZCB6a24sIHprciwgemt0IHdvdWxkIGJlIGVuYWJsZWQuCj4gPiAKPiA+IFBsZWFzZSBleHBs
YWluIHdoeSB0aGlzIGlzIG9rYXkuCj4gCj4gRnJvbSByaXNjdiBzY2FsYXIgY3J5cHRvIHNwZWMs
IHprIGlzIGEgc2hvcnRoYW5kCj4gZm9yIHprbiwgemtyIGFuZCB6a3QgYW5kIHprbiBhbHNvIGlu
Y2x1ZGVzIHpia2IsIHpia2MKPiBhbmQgemJreC4KPiAKPiA+IAo+ID4gPiA+IE5vdGUgdGhhdCB6
ayBpcyBhIHZhbGlkIGV4dGVuc2lvbiBuYW1lIGFuZCB0aGUgY3VycmVudAo+ID4gPiA+IERUIGJp
bmRpbmcgc3BlYyBhbGxvd3MgdGhpcy4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggYWxzbyBj
aGFuZ2VzIHRoZSBsb2dpY2FsIGlkIG9mCj4gPiA+ID4gZXhpc3RpbmcgbXVsdGktbGV0dGVyIGV4
dGVuc2lvbnMgYW5kIGFkZHMgYSBzdGF0ZW1lbnQKPiA+ID4gPiB0aGF0IGluc3RlYWQgb2YgbG9n
aWNhbCBpZCBjb21wYXRpYmlsaXR5LCB0aGUgb3JkZXIKPiA+ID4gPiBpcyBuZWVkZWQuCj4gPiAK
PiA+IERvZXMgaXQ/Cj4gCj4gVGhhdCBpcyBpbiB0aGUgb2xkIHZlcnNpb24gb2YgdGhpcyBwYXRj
aCwKPiBzaG91bGQgYmUgcmVtb3ZlZCBub3cKPiBzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvWXFZMGFTbmdqSTBIYzVkNEBTdW4vCj4gCj4gPiAKPiA+ID4gPiBUaGVyZSBj
dXJyZW50bHkgbGFja3MgYSBtZWNoYW5pc20gdG8gbWVyZ2UgdGhlbSB3aGVuCj4gPiA+ID4gcHJv
ZHVjaW5nIGNwdWluZm8uIE5hbWVseSBpZiB5b3UgcHJvdmlkZSBhIHJpc2N2LGlzYQo+ID4gPiA+
ICJydjY0aW1hZmRjX3prX3prcyIsIHRoZSBjcHVpbmZvIG91dHB1dCB3b3VsZCBiZQo+ID4gPiA+
ICJydjY0aW1hZmRjX3pia2JfemJrY196Ymt4X3prbmRfemtuZV96a25oX3prcl96a3NlZAo+ID4g
PiA+IF96a3NoX3prdCIKPiA+IAo+ID4gSSB0aGluayB0aGlzIGlzIGZpbmUuCj4gPiAKPiA+IFBs
ZWFzZSByZS13cmFwIHRoaXMgYWxsIHRvIDcyIGNoYXJhY3RlcnMuCj4gPiAKPiA+ID4gPgo+ID4g
PiA+IFRlc3RlZC1ieTogSmlhdGFpIEhlIDxqaWF0YWkyMDIxQGlzY2FzLmFjLmNuPgo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEhvbmdyZW4gKFplbml0aGFsKSBaaGVuZyA8aUB6ZW5pdGhhbC5tZT4K
PiA+IAo+ID4gVGhpcyBpcyBtaXNzaW5nIHlvdXIgU29CIFNhbXVlbC4KPiA+IAo+ID4gPiA+IC0t
LQo+ID4gPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggfCAxMSArKysrKysrKysr
Kwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyAgICAgICAgfCAxMSArKysrKysrKysr
Kwo+ID4gPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAzMCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1MiBpbnNlcnRp
b25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiA+ID4gaW5kZXgg
ZjA0MWJmYTdmNmEwLi5iODBjYTZlNzcwODggMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9od2NhcC5oCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gPiA+ID4gQEAgLTUzLDYgKzUzLDE3IEBACj4gPiA+ID4gICNkZWZpbmUgUklT
Q1ZfSVNBX0VYVF9aSUNTUiAgICAgICAgICAgIDQwCj4gPiA+ID4gICNkZWZpbmUgUklTQ1ZfSVNB
X0VYVF9aSUZFTkNFSSAgICAgICAgIDQxCj4gPiA+ID4gICNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9a
SUhQTSAgICAgICAgICAgIDQyCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQkMgICAg
ICAgICAgICAgIDQzCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQktCICAgICAgICAg
ICAgIDQ0Cj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQktDICAgICAgICAgICAgIDQ1
Cj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aQktYICAgICAgICAgICAgIDQ2Cj4gPiA+
ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS05EICAgICAgICAgICAgIDQ3Cj4gPiA+ID4gKyNk
ZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS05FICAgICAgICAgICAgIDQ4Cj4gPiA+ID4gKyNkZWZpbmUg
UklTQ1ZfSVNBX0VYVF9aS05IICAgICAgICAgICAgIDQ5Cj4gPiA+ID4gKyNkZWZpbmUgUklTQ1Zf
SVNBX0VYVF9aS1IgICAgICAgICAgICAgIDUwCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VY
VF9aS1NFRCAgICAgICAgICAgIDUxCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS1NI
ICAgICAgICAgICAgIDUyCj4gPiA+ID4gKyNkZWZpbmUgUklTQ1ZfSVNBX0VYVF9aS1QgICAgICAg
ICAgICAgIDUzCj4gPiA+ID4KPiA+ID4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX01BWCAgICAg
ICAgICAgICAgNjQKPiA+ID4gPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX05BTUVfTEVOX01BWCAg
ICAgMzIKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9jcHUuYwo+ID4gPiA+IGluZGV4IGEyZmM5NTIzMThlOS4uMTA1MjQzMjJh
NGMwIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5jCj4gPiA+ID4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMKPiA+ID4gPiBAQCAtMjE1LDcgKzIxNSwxOCBA
QCBzdGF0aWMgc3RydWN0IHJpc2N2X2lzYV9leHRfZGF0YSBpc2FfZXh0X2FycltdID0gewo+ID4g
PiA+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemlocG0sIFJJU0NWX0lTQV9FWFRfWklI
UE0pLAo+ID4gPiA+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemJhLCBSSVNDVl9JU0Ff
RVhUX1pCQSksCj4gPiA+ID4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6YmIsIFJJU0NW
X0lTQV9FWFRfWkJCKSwKPiA+ID4gPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHpiYywg
UklTQ1ZfSVNBX0VYVF9aQkMpLAo+ID4gPiA+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
emJrYiwgUklTQ1ZfSVNBX0VYVF9aQktCKSwKPiA+ID4gPiArICAgICAgIF9fUklTQ1ZfSVNBX0VY
VF9EQVRBKHpia2MsIFJJU0NWX0lTQV9FWFRfWkJLQyksCj4gPiA+ID4gKyAgICAgICBfX1JJU0NW
X0lTQV9FWFRfREFUQSh6Ymt4LCBSSVNDVl9JU0FfRVhUX1pCS1gpLAo+ID4gPiA+ICAgICAgICAg
X19SSVNDVl9JU0FfRVhUX0RBVEEoemJzLCBSSVNDVl9JU0FfRVhUX1pCUyksCj4gPiA+ID4gKyAg
ICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6a25kLCBSSVNDVl9JU0FfRVhUX1pLTkQpLAo+ID4g
PiA+ICsgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEoemtuZSwgUklTQ1ZfSVNBX0VYVF9aS05F
KSwKPiA+ID4gPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprbmgsIFJJU0NWX0lTQV9F
WFRfWktOSCksCj4gPiA+ID4gKyAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQSh6a3IsIFJJU0NW
X0lTQV9FWFRfWktSKSwKPiA+ID4gPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHprc2Vk
LCBSSVNDVl9JU0FfRVhUX1pLU0VEKSwKPiA+ID4gPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9E
QVRBKHprc2gsIFJJU0NWX0lTQV9FWFRfWktTSCksCj4gPiA+ID4gKyAgICAgICBfX1JJU0NWX0lT
QV9FWFRfREFUQSh6a3QsIFJJU0NWX0lTQV9FWFRfWktUKSwKPiA+ID4gPiAgICAgICAgIF9fUklT
Q1ZfSVNBX0VYVF9EQVRBKHNtYWlhLCBSSVNDVl9JU0FfRVhUX1NNQUlBKSwKPiA+ID4gPiAgICAg
ICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzYWlhLCBSSVNDVl9JU0FfRVhUX1NTQUlBKSwKPiA+
ID4gPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9EQVRBKHNzY29mcG1mLCBSSVNDVl9JU0FfRVhU
X1NTQ09GUE1GKSwKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gaW5kZXggYmRj
ZjQ2MGVhNTNkLi40NDdmODUzYTVhNGMgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvY3B1ZmVhdHVyZS5jCj4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVh
dHVyZS5jCj4gPiA+ID4gQEAgLTMwOSwxMCArMzA5LDQwIEBAIHZvaWQgX19pbml0IHJpc2N2X2Zp
bGxfaHdjYXAodm9pZCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNF
VF9JU0FfRVhUX01BUCgic3ZwYm10IiwgUklTQ1ZfSVNBX0VYVF9TVlBCTVQpOwo+ID4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VUX0lTQV9FWFRfTUFQKCJ6YmEiLCBSSVND
Vl9JU0FfRVhUX1pCQSk7Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBT
RVRfSVNBX0VYVF9NQVAoInpiYiIsIFJJU0NWX0lTQV9FWFRfWkJCKTsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFNFVF9JU0FfRVhUX01BUCgiemJjIiwgUklTQ1ZfSVNB
X0VYVF9aQkMpOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0VUX0lT
QV9FWFRfTUFQKCJ6YnMiLCBSSVNDVl9JU0FfRVhUX1pCUyk7Cj4gPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBTRVRfSVNBX0VYVF9NQVAoInpia2IiLCBSSVNDVl9JU0FfRVhU
X1pCS0IpOwo+ID4gCj4gPiBUaGlzIG9yZGVyIGRvZXMgbm90IGxvb2sgY29ycmVjdCwgcGxlYXNl
IGFkZCB0aGVtIGluIGFscGhhbnVtZXJpY2FsCj4gPiBvcmRlciBhcyB0aGUgY29tbWVudCB0aGVz
ZSBTRVRfSVNBX0VYVF9NQVAoKXMgcmVxdWVzdHMuIERpdHRvIGJlbG93Lgo+IAo+IEFncmVlZC4g
U2VlbXMgdGhhdCBJIGRpZCBub3Qgd29ya2VkIGNhcmVmdWxseSBmb3IgdGhpcyBwYXJ0LgoKT3Ig
aXQgY291bGQgYmUgbWUgd2hlbiByZWJhc2luZyB0aGF0IHBhdGNoLiBJbiBhbnkgY2FzZSwgaXQg
d2lsbCBiZQpmaXhlZCB3aXRoIHYyIG9mIHRoZSBwYXRjaC4KCkNoZWVycywKU2FtdWVsLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
