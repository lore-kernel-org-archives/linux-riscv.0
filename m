Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B056C54E58
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2024 02:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Cc:Date:In-Reply-To:From:
	Subject:Mime-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9ISivppV3sHoBRf2x9tS6ykrmzorP7SGBljUxEDcbE=; b=2q6eOi7GWFdp6e
	xRvZlm2dRxHQGig/GtHT8HiPBU5XoLUkef1uM8nldAoTUrAMmWGFDqnUEfE+OzmwNypEZZ829aq7Y
	xlE9GEVynhEJKp8YnnMfVLnJuuZ2b/ZX3cpnaIfm43H9pmtbLkcuiZHhCpcnDBgILsOheplEiBNIC
	FpucYU6CFyod2uivVz9OYf0rjovpJKsNpbxJ64uXPNW5Jv5zBEidhuwUUp2WP/GpdtMYIGRlJp5OM
	wI0eR4FMHT0onRbVlxMG3At37LJzy+Ytpf//FX13+qrMeyT8wg4MvOQYLUWX4GTiyuvEMel+AM2Z8
	tMYthscU4LriaTtrmPmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8Fd-00000001ax8-18iK;
	Thu, 21 Mar 2024 02:33:53 +0000
Received: from out203-205-221-210.mail.qq.com ([203.205.221.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn8FZ-00000001avS-1Zth
	for linux-riscv@lists.infradead.org;
	Thu, 21 Mar 2024 02:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1710988415; bh=jvqW5/ObhYNyQR5190tjSZW5PQRwEB05b9l2npYOAY4=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=yxgPRfK+FNrq4tCAdAOLeLzlw1xvkl9KFC5apelYqfIBZ3rRPO39O1T5Zj+qvLZOq
	 9hwBsIE/FnS51HpNswjCBK5PHAoa5Jw0s46pJAFKen0+EnWFAnshDeXaKmRtLhrshR
	 AupIxWyqLB1jMuqW/BqqdBdysLd14GHg6EYWMNac=
Received: from smtpclient.apple ([2001:da8:c800:d084:14cd:c7c7:b469:b667])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 85E9F09D; Thu, 21 Mar 2024 10:33:30 +0800
X-QQ-mid: xmsmtpt1710988410twwrif0ae
Message-ID: <tencent_A747085CAC18CD10C3C6623E1FC17B6D6707@qq.com>
X-QQ-XMAILINFO: NsEIGfsQmVV+Dqbc2ivggF/lZ/UdgUzvOqAfF0d2M1xQbC0tNPdq2rkhxuJZtn
	 3I13plBmdrPTwK49vfCIhf5mqneFs4uI8B7bqhZvzCzdRD5NWH2Ba7ZVII/givRhetTYQW7W9Dia
	 zM1nclvBU+ZaZ+g2aL+v/k0QDQWig0WDkRm+C5nV3pdfUF3n42lz2TFPE1xmMNgJ8mfaDZyTu6R9
	 UleRlV5/aggffHXMPM6+wqseV0mfZUlAhJXGhD4S+qkey+r/cgN9v3sDtCFlkWxjZiJXVEcEJd9w
	 NBbz8L1BcWDTK3SSa7QXEC3TQtBEaY2oLqtWehpC9Wps1b8USJ8LLup8QUN8BDbfq8gd77EGUXXq
	 nW74LR4XBuokBl1DLX5FS8NnB2oIndfvPcx9OovuQNc/MzurE3jDYiPFF6HRDhPE6aXibbsHjN6x
	 U3mtE2x3XrzMwE8+LeuVt7cVlRBAAu/gwfObye8R5dvsp1GHTWSoMYYr/Ho3dDvQWbZ/MXAqiikB
	 Mlq0YkjEb0aBYGmLbp6GDfaF5/PlpTRANthrOUZG2C4oqRAL+6StbLZCkfvM2hh7wU8Vj3Yom4HT
	 7znOTWOcSIJj5x74HyfkZj4CW45lOjj552xUxB9EYI9The/PiJWEwv1jjh8spIGn5T13tFBJ3U4j
	 5HoLG2850uCmR4566E8XRCBbZUkwZTpjYaFFYD+hXQ0auBZI9lD+YlMETmjSts/Wq2EgKJ9LB8OA
	 pGRv2JpQ2EHlBOyOnGLKxPEQlfUB6tKy3LqyQgmpnZvZooa9cRZ1msUrvnBqZDHJG0cDLpp6n0WM
	 OVvQ06/No/H3q4DvUUL7sMefxKu/nT+oVPsdULwdI8S07UkRLqzcadt2b5NiYHNBtLHYPvxFO7Sm
	 M6+9n0FV0GsFbKs/ylD7wQGiuL6a7S91htfHT0ymxeIHtgQu6bd/BJMU0Bod/LbAgC0oKeDdx9zS
	 11L+h7mFCD4MvP2FWU//ziTRYH8Du4MFAAahups30dLXwh9WxiqunAxq+PgBI0
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH v5 5/7] riscv: Kconfig.socs: Split ARCH_CANAAN and
 SOC_CANAAN_K210
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <20240320-harmful-carpenter-40a7de0f273e@spud>
Date: Thu, 21 Mar 2024 10:33:20 +0800
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Guo Ren <guoren@kernel.org>,
 linux-riscv@lists.infradead.org,
 Damien Le Moal <dlemoal@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 rabenda.cn@gmail.com
X-OQ-MSGID: <5BFB8DE5-8B10-49DA-957A-F78CD64042D8@cyyself.name>
References: <tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com>
 <tencent_6F35FEF31908DE6AEB385AE30AC658863C0A@qq.com>
 <CAJF2gTS1-VQP=gQBx=SoUWsdap153EGOObKVn+2L7=kbP2CqFg@mail.gmail.com>
 <20240306-scowling-mortify-9b427c80e8ab@wendy>
 <tencent_91E604E3B4D51DA37045625242A81B07F909@qq.com>
 <20240320-ideology-pasty-d3aea07cc519@spud>
 <20240320-harmful-carpenter-40a7de0f273e@spud>
To: Conor Dooley <conor@kernel.org>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_193349_821658_E74D29E5 
X-CRM114-Status: GOOD (  14.27  )
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

Cgo+IE9uIE1hciAyMSwgMjAyNCwgYXQgMDI6NTEsIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gCj4gT24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMDU6Mzk6MTRQTSArMDAw
MCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IAo+PiBJIGdvdCBhIGsyMzAgYm9hcmQgKHRoZSBjYW5t
diBvbmUpIHNvIEkgc2hvdWxkIGJlIGFibGUgdG8gdGVzdCB0aGlzCj4+IG15c2VsZiBiZWZvcmUg
cGlja2luZyBzdHVmZiB1cC4KPiAKPiBJJ3ZlIHRha2VuIGEgYml0IG9mIGEgbG9vayBhdCB0aGUg
InNkayIgYW5kIGFwcGVhcnMgdG8gYmUgYSBjb21wbGV0ZQo+IG1lc3MgdG8gYSBub24tY2hpbmVz
ZSBzcGVha2VyIGxpa2UgbWUuCj4gSSBrbm93IHlvdSBsaW5rZWQgYSBjb3B5IG9mIG9wZW5zYmkg
dG8gdXNlIHdpdGggdGhpcywgYnV0IGRvIHlvdSBhbHNvCj4gaGF2ZSBhIHZlcnNpb24gb2YgVS1C
b290IHRvIHVzZSB3aXRoIHRoaXMgdGhhdCBpcyBub3QgcmlkZGxlZCB3aXRoCj4gY3JhcCBhbmQg
d2lsbCBjb21waWxlIHdpdGggYSBub3JtYWwgdG9vbGNoYWluPwo+IAoKSSBkb27igJl0IGhhdmUg
b25lLiBCdXQgSSBrbm93IFJldnkgKEhhbiBHYW8pIGJ1aWx0IGEgdS1ib290IHJlcG8KZnJvbSB2
ZW5kb3IgU0RLIHdoaWNoIGlzIGF0IHN1Ym1vZHVsZSBvbgpodHRwczovL2dpdGh1Yi5jb20vcmV2
eW9zL21raW1nLWsyMzAgLiBIb3dldmVyLCBpdCBqdXN0IGFwcGx5IGEgaHVnZQpkaWZmIGZyb20g
dmVuZG9yIFNESyB0byBtYWlubGluZSB1LWJvb3QgYW5kIGNhbiBiZSBidWlsdCBmcm9tIGEKc3Rh
bmRhcmQgZ2NjIHRvb2xjaGFpbi4KCj4gSSBoYXZlIGNoYW5jZWQgdXBvbiBDb3VybWlzY2gncyBy
ZXBvIHRoYXQgbG9va3Mgc2lnbmlmaWNhbnRseSBtb3JlCj4gdXNhYmxlIHRoYW4gd2hhdGV2ZXIg
Q2FuYWFuIGhhdmUgc28gSSBndWVzcyBJIHdpbGwgdXNlIHRoYXQ6Cj4gaHR0cHM6Ly9jb2RlLnZp
ZGVvbGFuLm9yZy9Db3VybWlzY2gvazIzMC1ib290Cj4gCgpUaGFua3MgZm9yIHRoaXMgaGludC4K
Cj4gOikKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
