Return-Path: <SRS0=VH9+=LQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA698C4743C
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 01:09:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B04D60FF2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jun 2021 01:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B04D60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amL2hDt7WHUV4wuoCZUq/tULJbxZgZpV78zfwxbcgqY=; b=ZJGhmJHfIqpf4uDwgk2kptMIck
	u/KMNFCXl3IhABRysP+xNCmcfnqoFgGUKFc0abHwTjAcN6Rz8j8oJhaRAkGymvjV2djJoKRcnhStl
	DmR04L9aWbxZMpPlSMkesfvk8VjSaP9tHbPFYxQH7HOz4MAtqTN7JpVXwPOCB46uEHjN8ZzTvUHc2
	ho+IfDZy9YejBvnEdqRLM59+JIJnChx0cF3/LZBiugHJz4UbBmb0SS3IS0GV8CW3zE7xCIukYIu9T
	cHl1FJ2ufdGTKjiZIiNWKyXhb/QcEwJg9ICoLJt8dsNJ7PRhxnGGnsIL1fIvyeyqtvx+2mffjg1Fk
	KGx2w4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvUur-005Imk-G9; Tue, 22 Jun 2021 01:09:25 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvUun-005Ill-Kk
 for linux-riscv@lists.infradead.org; Tue, 22 Jun 2021 01:09:23 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15M19JSv036067
 for <linux-riscv@lists.infradead.org>; Tue, 22 Jun 2021 04:09:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1624324154; x=1626916154;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EOqcGFuYtBWb7hk+r1SbucjBncFWjcMhcQi3y8BZY7g=;
 b=gNptt+jkmO7TyMLwKjxOlDW1FM4XhF2Vz9cP0Rc0/SnomfO1DkLuY3Vo2T8im9Q2
 Tx2oa/L1a9GiMfB0gYXJNXjq/CJYU+pBR+6uivP6IQfAT2oT2CE8J3hfyvm6g4fy
 DjYdpKOgN2VDB9fNiuyrDY8n5tn6dUf38OHt8+U4mo0tCP4pyePnQmtXeoVnnkfa
 7CHBRys2PX0Pf4b9XP1gycmAHmw1idsVdo42x0968/QO8ZTqK+VPtap5aUD///3L
 +9JjqOPTA3YKOTRVGe3FWp1c+cZAS9daeggKVTg5CA+wnkqgY5rGZZbiXNob4TDg
 b0gf+/uR+VMxiTqNdxZ4vQ==;
X-AuditID: 8b5b014d-96ef2700000067b6-7f-60d1383af649
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 50.70.26550.A3831D06; Tue, 22 Jun 2021 04:09:14 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 04:09:14 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>,
 Drew Fustini <drew@beagleboard.org>, Bin Meng <bmeng.cn@gmail.com>,
 David Laight <David.Laight@aculab.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 0/3] riscv: optimized mem* functions
Organization: FORTH
In-Reply-To: <20210617152754.17960-1-mcroce@linux.microsoft.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
Message-ID: <e968312557f147af1e5efb341eeef0ad@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRmVeSWpSXmKPExsXSHT1dWdfK4mKCwYTpuhbb3l1lsdj6exa7
 xaIV31kspvbEW+xYupnJ4t6KZewWL/Y2slg8WTOT0aJj11cWi8u75rBZbPvcwmZx8dd8RouX
 l3uYLdpm8TvwefTPnsLm8e73MkaPNy9fsngc7vjC7tHR94/FY+esu+wem1Z1snn82n6UyWPz
 knqPS83X2T0+b5LzaD/QzRTAE8Vlk5Kak1mWWqRvl8CVsevWI/aC06wV1xv/sDcwnmDpYuTk
 kBAwkVixuYG9i5GLQ0jgKKPE2lmzGCESphKz93aC2bwCghInZz4Ba2AWsJCYemU/I4QtL9G8
 dTYziM0ioCpx/PphNhCbTUBTYv6lg2D1IgK6Ehc/HAZbwCwwnUXiV+9usCJhAWuJDz8/gg3i
 FxCW+HT3IiuIzSngIHGvcQlYjZCAvcT+bd9ZIY5wkTj7qJUJ4jgViQ+/HwAN5eAQBbI3z1Wa
 wCg4C8mps5CcOgvJqQsYmVcxCiSWGetlJhfrpeUXlWTopRdtYgRHHqPvDsbbm9/qHWJk4mA8
 xCjBwawkwnsz5UKCEG9KYmVValF+fFFpTmrxIUZpDhYlcV5evQnxQgLpiSWp2ampBalFMFkm
 Dk6pBqZ9m29Zv3HecHM/m1Zfw2yXbqslj7JOGm99eU+mK+7OzMuXP1fJhRSpSZwxmNaXU+fS
 taNpSkbGv4WX2N9ltbV9z1ef97pdacEe8TK3uZF9+df288yxyShZczPXzyXg6d/dNUf3bVh7
 62SyfcaLCzWn3Hb/2jqN79AzvcmGe3JECn9dmHdx4fZZjEZSorVSUyIPPd1tteMSy8apmzTz
 zc8s4hOb5NZvn3WaWbRGLpLDPazI8TTLlZad1+3Npn8Jr43h3rjYfaNAVdfmn/dklBOEXa1T
 pnyMvifkfN4puzBjgYlz6G3FVRsXL9y9//zXZN6wyMyX6X9X79skYbBI+DWv2HLuI8pzmX7x
 vb262X2FEktxRqKhFnNRcSIAoKyPdisDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_180922_093782_0C6C516F 
X-CRM114-Status: UNSURE (   6.93  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWF0dGVvLAoKzqPPhM65z4IgMjAyMS0wNi0xNyAxODoyNywgTWF0dGVvIENyb2NlIM6t
zrPPgc6xz4jOtToKPiBGcm9tOiBNYXR0ZW8gQ3JvY2UgPG1jcm9jZUBtaWNyb3NvZnQuY29tPgo+
IAo+IFJlcGxhY2UgdGhlIGFzc2VtYmx5IG1lbXtjcHksbW92ZSxzZXR9IHdpdGggQyBlcXVpdmFs
ZW50Lgo+IAo+IFRyeSB0byBhY2Nlc3MgUkFNIHdpdGggdGhlIGxhcmdlc3QgYml0IHdpZHRoIHBv
c3NpYmxlLCBidXQgd2l0aG91dAo+IGRvaW5nIHVuYWxpZ25lZCBhY2Nlc3Nlcy4KPiAKPiBUZXN0
ZWQgb24gYSBCZWFnbGVWIFN0YXJsaWdodCB3aXRoIGEgU2lGaXZlIFU3NCBjb3JlLCB3aGVyZSB0
aGUKPiBpbXByb3ZlbWVudCBpcyBub3RpY2VhYmxlLgo+IAoKVGhlcmUgYXJlIGFscmVhZHkgZ2Vu
ZXJpYyBDIGltcGxlbWVudGF0aW9ucyBmb3IgbWVtY3B5L21lbW1vdmUvbWVtc2V0IGF0IApodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS4xMy1yYzcvc291cmNlL2xpYi9zdHJpbmcu
YyNMODcxIGJ1dCAKYXJlIGRvaW5nIG9uZSBieXRlIGF0IGEgdGltZSwgSSBzdWdnZXN0IHlvdSB1
cGRhdGUgdGhlbSB0byBkbyAKd29yZC1ieS13b3JkIGNvcHkgaW5zdGVhZCBvZiBpbnRyb2R1Y2lu
ZyB5ZXQgYW5vdGhlciBtZW1jcHkvbWVtbW92ZSBDIAppbXBsZW1lbnRhdGlvbiBvbiBhcmNoL3Jp
c2N2Ly4KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
