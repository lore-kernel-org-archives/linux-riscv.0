Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077FDC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Feb 2023 08:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsxEJvbEqNF6uc5NS8acgjXfd4CdbPoCt7LIDBfX7wY=; b=kTdrgQ9d9sZa7t
	YH54kEyGRMZdagH/xfhHRMRitn7zIJGRAscR2WOI+SMzvndAmt0Cgpy+AQIRYFCN8a1LhINqOwXZ+
	B2AZMBQyxrkdsq71bW1NJf6N0NqDHkePq5KvXL8ur+enEQnX7yr16dg1fDukDYxBhLRfTlk0dhhsM
	Fjd48Il431LnInqMeBFY/4e9DjGBz7ttQlA9t1UVVYPG0wqM9OnSRGtXyFEtar9etZ7is+CfpfnEZ
	cCowWBVDQinM7/AIn9RkZkto8JxrLBvZfmE7b0GN3nqrr/5o83bTOmvA+d7uOoXO5LdWbSEx5781M
	BodcaAYHo2e2uo8juQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwf2-007gQ9-PH; Mon, 06 Feb 2023 08:15:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOwez-007gPW-OX
	for linux-riscv@lists.infradead.org; Mon, 06 Feb 2023 08:15:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A40AB80D88;
	Mon,  6 Feb 2023 08:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37752C433EF;
	Mon,  6 Feb 2023 08:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675671330;
	bh=2gQ41oYPOBY5IgrYuSTiswD4o/d5V+Imcxfkr8pdJVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OLCLAE9iWVg8sdJLB1pTwzy/jiRZOhjVjYYxysGh7i1M45W5h29UkzQGcta/UFQUi
	 47AjTT1hAsX1fgw+3wEmY2oulcaMkHwvAyD3JmHpCP1tsx/9l9fcSBG16FMZbvnc/D
	 rCdIBNh+GCr5jsFLmQAkjKhekZeCT2ebH2xVGwo+ixHlM0MnU/w2OTq1mfvtcDn9hG
	 z8NMSQQUKuZ1NlAER0OK2Akix3cNgSTovObtCwyX64VJYFJRT+n6Ryti4KdRbXCwVl
	 /I5UWQ0gX0CNEdz7B3DLd5T0r9nXeWzwx1AOwBuCI0TuSDGb6rEgoNDZzu5KRB65aY
	 G5ZpZL3BJMrkg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, guoren@kernel.org, palmer@rivosinc.com,
 conor.dooley@microchip.com, liaochang1@huawei.com, jrtc27@jrtc27.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Bjorn
 Topel <bjorn.topel@gmail.com>
Subject: Re: [PATCH V2] riscv: kprobe: Fixup misaligned load text
In-Reply-To: <20230204063531.740220-1-guoren@kernel.org>
References: <20230204063531.740220-1-guoren@kernel.org>
Date: Mon, 06 Feb 2023 09:15:27 +0100
Message-ID: <87mt5rgqg0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_001533_959033_4F82FE51 
X-CRM114-Status: UNSURE (   7.92  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBUaGUgY3VycmVudCBrcHJvYmUgd291bGQgY2F1c2UgYSBtaXNhbGln
bmVkIGxvYWQgZm9yIHRoZSBwcm9iZSBwb2ludC4KPiBUaGlzIHBhdGNoIGZpeHVwIGl0IHdpdGgg
dHdvIGhhbGYtd29yZCBsb2FkcyBpbnN0ZWFkLgo+Cj4gRml4ZXM6IGMyMmIwYmNiMWRkMCAoInJp
c2N2OiBBZGQga3Byb2JlcyBzdXBwb3J0ZWQiKQo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1
b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi84
NzhyaGlnOXpqLmZzZkBhbGwueW91ci5iYXNlLmFyZS5iZWxvbmcudG8udXMvCj4gUmVwb3J0ZWQt
Ynk6IEJqb3JuIFRvcGVsIDxiam9ybi50b3BlbEBnbWFpbC5jb20+Cj4gQ2M6IEplc3NpY2EgQ2xh
cmtlIDxqcnRjMjdAanJ0YzI3LmNvbT4KPiAtLS0KPiBDaGFuZ2Vsb2cKPiBWMjoKPiAgLSBPcHRp
bWl6ZSBjb2RpbmcgY29udmVudGlvbiAoVGh4IEJqb3JuICYgSmVzc2ljYSkKClRoYW5rIHlvdSBm
b3IgZml4aW5nIHRoaXMhCgpSZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVs
Lm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
