Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80199C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 07:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6M4cxlOJ+lbqsMWrGG4GgzRIFfbZJ0A/ZkmoBRV6+w=; b=Y83YrcPltaUqvO
	8rbkKIFrA2u9GJMHCRE3PGBW5i22xFfqELNGXB6gSWMlPAS6iNXjA8E2J8oEpJDPwU6tsumoPXQFS
	KGXKvV8Ft+xN+jXlaEVMRSfFyjiPDqg2+Nd8SvY79AxBNJV1lM95TEnp4jd/97kioGf2hdWG9xN1F
	dN041xNptc84jNuQ4SkPKEzJ3PDm1XZTA4gcdIEbzH3bAzpL6uSFk5+v52RrtLV45y2Ni1WxoZQk4
	WKbcTsVLUlJT5LGGuQrfLxSAxxTVgmHKS81X6LQvr+BIpBdC4omHoUNOM9s+mi17zkQbH0HZQf16/
	UdYSEiRvUJUxZ0ATVarQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HQw-00E64g-Eu; Wed, 30 Nov 2022 07:23:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0HQs-00E621-W6
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 07:23:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8EFDDB8199C
	for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACCDFC4347C
	for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669792979;
	bh=l8TG0zDhu2CtfxNlo3/zXzaH7ZIK0gStVku6u+BPku4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LTp7lFL1uBRZI7S3tOANwcYEZwp0WoQj3LT9RPG0sgVQLz4ZP6akLMOXzpiZ5xvji
	 /ABbXWcD5ppaarzrPr4BCdAfTsWrqE+4k6SzYVQy+GDaIGjIeD4OJZxiXTL7ViiwjB
	 6gVa2/JzN0vso1FXhvZ5kj43NNZqRtzJiOJm2+tOtes+5RHWil2JCTHKy0NJNkOuM2
	 K1ExdELjpUiejxLn+w/+z8BE9RDYu+cgidFw86G4+Q6cUu01dMPOh7a0ST+6PiZt/G
	 nvlCR9H9WwKFtkUqM3msKFe8WGicuQ7DgAhsFsEQo6WcYZ0R13S3dFuJoAg3ip13Eb
	 nTg1QjxNwI0dw==
Received: by mail-ej1-f49.google.com with SMTP id vp12so37921624ejc.8
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 23:22:59 -0800 (PST)
X-Gm-Message-State: ANoB5pk8R5bldgXiMioeTOEZCklkM1iv1bfv7xBONqwH1i88J89YdQXx
	Jc6pQckJa+BHA/Iz2otdwHHllaOWFqwv6rqm9no=
X-Google-Smtp-Source: AA0mqf49bMbZfOFPJ53XdR+Xd3Pu2yDNAwaf+OSHZXIyf8yZNlV4ZZsWp/eqX8qI99PoUS2/j/0pUXpnWhRcE62O46I=
X-Received: by 2002:a17:906:99d3:b0:78d:c7fd:f755 with SMTP id
 s19-20020a17090699d300b0078dc7fdf755mr36020981ejn.702.1669792977892; Tue, 29
 Nov 2022 23:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20221128154506.2691-1-suagrfillet@gmail.com> <CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com>
In-Reply-To: <CAAYs2=iYn8sLQB8oh+RzTKd2VKs8MXOLX6Mwpamx5gdVVN6mkA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 30 Nov 2022 15:22:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQKgqs4zePmW00Nd1PAUk76ZCRfyfPFzigQn3Pg0-=SEQ@mail.gmail.com>
Message-ID: <CAJF2gTQKgqs4zePmW00Nd1PAUk76ZCRfyfPFzigQn3Pg0-=SEQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv/ftrace: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
To: Song Shuai <suagrfillet@gmail.com>
Cc: paul.walmsley@sifive.com, wangkefeng.wang@huawei.com, 
	juerg.haefliger@canonical.com, anshuman.khandual@arm.com, 
	alexandre.ghiti@canonical.com, conor.dooley@microchip.com, 
	atishp@atishpatra.org, heiko@sntech.de, palmer@dabbelt.com, 
	apatel@ventanamicro.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_232303_341084_4C9220F9 
X-CRM114-Status: GOOD (  22.81  )
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

T24gVHVlLCBOb3YgMjksIDIwMjIgYXQgODowNSBQTSBTb25nIFNodWFpIDxzdWFncmZpbGxldEBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiDk
uo4yMDIy5bm0MTHmnIgyOOaXpeWRqOS4gCAxNTo0NeWGmemBk++8mgo+ID4KPiA+IEZyb206IFNv
bmcgU2h1YWkgPHN1YWdyZmlsbGV0QGdtYWlsLmNvbT4KPiA+Cj4gPiBJbiBSSVNDLVYsIC1mcGF0
Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5IG9wdGlvbiBpcyB1c2VkIHRvIHN1cHBvcnQKPiA+IGR5bmFt
aWMgZnRyYWNlIGluIHRoaXMgY29tbWl0IGFmYzc2YjhiODAxMSAoInJpc2N2OiBVc2luZwo+ID4g
UEFUQ0hBQkxFX0ZVTkNUSU9OX0VOVFJZIGluc3RlYWQgb2YgTUNPVU5UIikuIFNvIHJlY29yZG1j
b3VudAo+ID4gZG9uJ3QgaGF2ZSB0byBiZSBjYWxsZWQgdG8gY3JlYXRlIHRoZSBfX21jb3VudF9s
b2Mgc2VjdGlvbiBiZWZvcmUKPiA+IHRoZSB2bWxpbnV4IGxpbmtpbmcuCj4gPgo+ID4gSGVyZSBz
ZWxlY3RzIEZUUkFDRV9NQ09VTlRfVVNFX1BBVENIQUJMRV9GVU5DVElPTl9FTlRSWSB0byB0ZWxs
Cj4gPiBNYWtlZmlsZSBub3QgdG8gcnVuIHJlY29yZG1jb3VudC4KPiA+Cj4gPiBMaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi9DQUFZczI9ajNFYWs5dlU2eGJBdzB6UHVv
aDAwcmg4djVDMlUzZmVQa29rWkZpYldzMmdAbWFpbC5nbWFpbC5jb20vVC8jdAo+ID4gU2lnbmVk
LW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPgo+ID4gVGVzdGVkLWJ5
OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiBUaGlzIHBhdGNoIGhhcyBjb25mbGljdHMg
d2l0aCB0aGUgY29tbWl0ICgicmlzY3Y6IGZ0cmFjZTogQWRkCj4gRFlOQU1JQ19GVFJBQ0VfV0lU
SF9ESVJFQ1RfQ0FMTFMKPiBzdXBwb3J0IikgYW5kIGl0cyBuZXh0IGNvbW1pdCBpbiB0aGlzIGZp
bGUuCj4KPiBIb3cgYWJvdXQgcmVwb3N0aW5nIHRoaXMgcGF0Y2ggYmFzZWQgb24gdGhlIGFib3Zl
IGNvbW1pdHMgYW5kIGZvbGRpbmcKPiBpdCBpbnRvIHRoZSB2NSB2ZXJzaW9uPwpPa2F5LCBpdCdz
IHRoZSBwcm9wZXIgcmVhc29uIHRvIG1lcmdlIHRoZW0uIFRoeCEKCj4KPiBIZXJlIHBhc3RlcyB0
aGUgbGluayBmb3IgeW91ciBjb252ZW5pZW5jZS4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9s
aW51eC1yaXNjdi8yMDIyMTEyOTAzMzIzMC4yNTU5NDctNy1ndW9yZW5Aa2VybmVsLm9yZy9ULyN1
Cj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDEgKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25m
aWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IGluZGV4IGZhNzg1OTVhNjA4OS4uYWZjNTIwYTQ1
ZGVkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jp
c2N2L0tjb25maWcKPiA+IEBAIC0yNzcsNiArMjc3LDcgQEAgY29uZmlnIEFSQ0hfUlY2NEkKPiA+
ICAgICAgICAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0UgaWYgIVhJUF9LRVJORUwgJiYgTU1V
ICYmICQoY2Mtb3B0aW9uLC1mcGF0Y2hhYmxlLWZ1bmN0aW9uLWVudHJ5PTgpCj4gPiAgICAgICAg
IHNlbGVjdCBIQVZFX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUyBpZiBIQVZFX0RZTkFNSUNfRlRS
QUNFCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZUUkFDRV9NQ09VTlRfUkVDT1JEIGlmICFYSVBf
S0VSTkVMCj4gPiArICAgICAgIHNlbGVjdCBGVFJBQ0VfTUNPVU5UX1VTRV9QQVRDSEFCTEVfRlVO
Q1RJT05fRU5UUlkgaWYgRFlOQU1JQ19GVFJBQ0UKPiA+ICAgICAgICAgc2VsZWN0IEhBVkVfRlVO
Q1RJT05fR1JBUEhfVFJBQ0VSCj4gPiAgICAgICAgIHNlbGVjdCBIQVZFX0ZVTkNUSU9OX1RSQUNF
UiBpZiAhWElQX0tFUk5FTAo+ID4gICAgICAgICBzZWxlY3QgU1dJT1RMQiBpZiBNTVUKPiA+IC0t
Cj4gPiAyLjM0LjEKPiA+Cj4KPgo+IC0tCj4gVGhhbmtzLAo+IFNvbmcKCgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
