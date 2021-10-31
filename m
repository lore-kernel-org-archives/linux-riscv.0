Return-Path: <SRS0=Kirc=PT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA066C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 11:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DD5160EE3
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Oct 2021 11:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DD5160EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCvTte4OGKbNBKlF6nMOVsczJ5MOKorHJBYeJHmT7Es=; b=d3m6KCRxOi0x2T
	F5i0mU4RmwlLVf5wtCXneW4xdb1av1mVWaeSP1oRUo7x3juCY+yrN4EcC1Aegc1IlEETaskFXzktU
	uVFT+ezOFbOAfdpFuqAszT8nUPr3+PXewsqqgefIlCXmVNg91yWWe+pOSmkwLttbAMV4yosOgy3IB
	CvmC1Y2hTldMXIngKimN2OXmKFddwWR98J9jRWDuqMPdX6tqfHwZguthGNzN74YetNeKF/8cfJhgt
	2xVtck7mDn6LlIQHcCIvzxp5tNeo2/j5B06E75FXaVp9QW2ZpEidrJj2MqUAx7pMyDUlhAAmYbyJG
	SI5WbN74gy0F6FNOd5sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mh8nY-00DuET-Vb; Sun, 31 Oct 2021 11:14:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mh8nX-00DuDo-0H; Sun, 31 Oct 2021 11:14:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id p14so23882549wrd.10;
 Sun, 31 Oct 2021 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=61FvhhsNkrh8p46sRtRayu7rrrGsE6so+sH35+PNfww=;
 b=b+usS8BJfKn+Absvpirb7SiBSJacPaQEjEbGI5s3LhsWIEIXHdP9Yzx1Nqu3+2nbdl
 3DoCBuPoU7H7PfLw+uHkXbGk8U5PygtRXFIfqGL6v9R+p3kJ+yJoNwqo8fsFE/wYesQ4
 MYd0HadUiQPjx2wF4lyroZYqladcTTbYpq20UZH4FvLpmbZiohAErgWL+4OFXSTF3DoN
 8vS/aNWfXR8pptCM/E3/oewqf/hX2JQd9DfNOVd4TtmpaDHfu1FQj58n2JpHWrNaTERV
 BSQCTCPwXjEmmI+1arOyUzFzfH0ZIY1oGA4GICP5Xqdzk8eZTU+T/3Duti1QHQ8K0Z4K
 PIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=61FvhhsNkrh8p46sRtRayu7rrrGsE6so+sH35+PNfww=;
 b=2nMINGikzi/Fb79SfwZP040fviLXNbBeBWComkRbuIsdqOxCCx9QxZCDYO0q7NHQ/p
 wSFA7Y3i2xDJ9Ph9sga9R49V2HLRkPSmmNgmi1V2ZQ760Ylog3TaLyr85/RGkiP/Sajw
 vesyHAeiegT2ldhe/+STPosK9LyfPBfr0yPXOLiG64NS4AEAjqMAbdeMyTSz+HVl3lH1
 ooFR8DGOFM4p2VHdG1l+EKEvhckj2S7WgoMLMeeYlgPasGuVO3+OoY+Gkd0as8EFVWSL
 /aphJhsv4xQmLQc+qZsVxIf6taHTh6hXtPpLbLv/uEJ/pnxZ0o+lW03k8R/t6dlDOSmX
 /HhQ==
X-Gm-Message-State: AOAM530vDWbBLnHf9MI7ut8Eiop2FzSAwqBQnLATBLLDi3LEajwcb25Z
 3zZ3mnkYWKFqsKDslgX/lfTptJuIcumg+OR8utE=
X-Google-Smtp-Source: ABdhPJz2PC2Voc3Hioat8lX7H740j7PGIpN/On2VMFDGbYjD7QNjVdADc24scQv0n9LxvPTmtglbpLo7fsoj//JibDk=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr28912160wry.321.1635678884816; 
 Sun, 31 Oct 2021 04:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211030031832.165457-1-liaochang1@huawei.com>
 <20211030031832.165457-3-liaochang1@huawei.com> <87ee83goju.fsf@disp2133>
In-Reply-To: <87ee83goju.fsf@disp2133>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Sun, 31 Oct 2021 12:14:33 +0100
Message-ID: <CAJ+HfNjaBQrBtOuMvTccbb2K-Ua=T1eZk0+70hp0_aOAc83A-Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] RISC-V: use memcpy for kexec_file mode
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Liao Chang <liaochang1@huawei.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Nick Kossifidis <mick@ics.forth.gr>, jszhang@kernel.org,
 guoren@linux.alibaba.com, 
 Pekka Enberg <penberg@kernel.org>, sunnanyong@huawei.com,
 wangkefeng.wang@huawei.com, 
 changbin.du@intel.com, Alex Ghiti <alex@ghiti.fr>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, kexec@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_041447_085335_2D8B41BD 
X-CRM114-Status: GOOD (  17.85  )
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

T24gU2F0LCAzMCBPY3QgMjAyMSBhdCAwNTo1MSwgRXJpYyBXLiBCaWVkZXJtYW4gPGViaWVkZXJt
QHhtaXNzaW9uLmNvbT4gd3JvdGU6Cj4KPiBMaWFvIENoYW5nIDxsaWFvY2hhbmcxQGh1YXdlaS5j
b20+IHdyaXRlczoKPgo+ID4gVGhlIHBvaW50ZXIgdG8gYnVmZmVyIGxvYWRpbmcga2VybmVsIGJp
bmFyaWVzIGlzIGluIGtlcm5lbCBzcGFjZSBmb3IKPiA+IGtleGVjX2ZpbCBtb2RlLCBXaGVuIGNv
cHlfZnJvbV91c2VyIGNvcGllcyBkYXRhIGZyb20gcG9pbnRlciB0byBhIGJsb2NrCj4gPiBvZiBt
ZW1vcnksIGl0IGNoZWNrZXMgdGhhdCB0aGUgcG9pbnRlciBpcyBpbiB0aGUgdXNlciBzcGFjZSBy
YW5nZSwgb24KPiA+IFJJU0NWLVYgdGhhdCBpczoKPiA+Cj4gPiBzdGF0aWMgaW5saW5lIGJvb2wg
X19hY2Nlc3Nfb2sodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpCj4gPiB7
Cj4gPiAgICAgICByZXR1cm4gc2l6ZSA8PSBUQVNLX1NJWkUgJiYgYWRkciA8PSBUQVNLX1NJWkUg
LSBzaXplOwo+ID4gfQo+ID4KPiA+IGFuZCBUQVNLX1NJWkUgaXMgMHg0MDAwMDAwMDAwIGZvciA2
NC1iaXRzLCB3aGljaCBub3cgY2F1c2VzCj4gPiBjb3B5X2Zyb21fdXNlciB0byByZWplY3QgdGhl
IGFjY2VzcyBvZiB0aGUgZmllbGQgJ2J1Zicgb2Ygc3RydWN0Cj4gPiBrZXhlY19zZWdtZW50IHRo
YXQgaXMgaW4gcmFuZ2UgW0NPTkZJR19QQUdFX09GRlNFVCAtIFZNQUxMT0NfU0laRSwKPiA+IENP
TkZJR19QQUdFX09GRlNFVCksIGlzIGludmFsaWQgdXNlciBzcGFjZSBwb2ludGVyLgo+ID4KPiA+
IFRoaXMgcGF0Y2ggZml4ZXMgdGhpcyBpc3N1ZSBieSBza2lwcGluZyBhY2Nlc3Nfb2soKSwgdXNl
IG1lbXBjeSgpIGluc3RlYWQuCj4KPiBJIGFtIGEgYml0IGNvbmZ1c2VkLgo+Cj4gV2h5IGlzIG1h
Y2hpbmVfa2V4ZWMgZXZlciBjYWxsaW5nIGNvcHlfZnJvbV91c2VyPyAgVGhhdCBzZWVtcyB3cm9u
ZyBpbgo+IGFsbCBjYXNlcy4KPgoKSXQncyBub3QgbWFjaGluZV9rZXhlYyAtLSBpdCdzIG1hY2hp
bmVfa2V4ZWNfcHJlcGFyZSwgd2hpY2ggcHVsbHMgb3V0CnRoZSBGRFQgZnJvbSB0aGUgaW1hZ2Uu
IEl0IGxvb2tzIGxpa2UgTUlQUyBkb2VzIGl0IHNpbWlsYXJseS4KCihDYXZlYXQ6IEkgbWlnaHQg
YmUgY29uZnVzZWQgYXMgd2VsbCEgOy0pKQoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
