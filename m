Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D02C001E0
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 01:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTTgUWtiz0f2NRBfsrFvR4npr45NAb53ajKQRNAOKJI=; b=nEzwG2H8pcR6e9
	KLX1t0W8HOgQKBLu1WeXL8cvNud9BKvs243Y2mTogUawFGbGSZdI4Z2SyYsgwRB78zqNZt1v+7mi9
	+xqoq+pUT1v4uRBeKlgsV/xAuwFfnZlNoJBFP6CUwZYuyCXgbxgqOp7cz5TvaE5ee1SwNRrsQEGYS
	jOsdwAv/b2hX+MCOecvLSf2C33GPG/CDH46YLZALDNgLm1I9fqLWj/HY8Y6pbfuTjDSHZxa08TS/5
	Rc1PDVO6sh4zg1pgHkUsvVfzQNGvlBVVd9RrfhRx79f+xpzBQH/tdhSBwwODSd9zO3yYQem4JLHkx
	34UvO938ZUd6TNAgJoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPCQY-0018hr-1c;
	Fri, 28 Jul 2023 01:37:58 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPCQU-0018gM-2W;
	Fri, 28 Jul 2023 01:37:56 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9c66e2e36so13951701fa.1;
        Thu, 27 Jul 2023 18:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690508268; x=1691113068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmjTr+Ekzs2/OcMS11bK61qR3FE3+8TZNMuctMbi2xU=;
        b=g3XKJEBsMYV3c0Kt8g5oFFYp9QszFI4Xi44G0Vw+EBF1HesmjK55TbMbLP9qV1nrWq
         hqs3p0Uql3PmXLMlboft9T8dJATBm1bmt71uxJ0xe0ZpnzS65vPIrluuodviQhC7Vmbu
         belTfY1/A6XVbJd1Ca21hzt5C97wjfwHGqAZtnw+H9aPkbpp1xBMDkOHH1NT2/aSp49o
         QFEfxSo6zTyPkfaj3tIAOiCtWt11HHT6uZoGAqbc1b+HKjtfZdQ6vxa/h8pyedq5hiuf
         PCjjB7IZkdYe4ZiTc6OYPdx4bzbysqSB+7Oq8uh2akBDNMVUs1LyTg5dz32Nba9MpHrA
         SBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690508268; x=1691113068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tmjTr+Ekzs2/OcMS11bK61qR3FE3+8TZNMuctMbi2xU=;
        b=bysbs27ASbThkZXtiOZH0YaXY9Iwi09TKhTKTZaleYTroMaZUET/OEf3UlE4WLM6nj
         zf3p7TsZPtMAMKHsoX/WpVxNZI39YbVqitXQbg/LnxdX3Jmz7TPmVB4EP5UISGOMhRJ9
         mpcVmoNQ3d+p59KOg2BD3Oh6Ksiss22hQVuD0DIlV7M8yhYBCnVyS0kKgqgnbPxgTVED
         rVKoqZKzY4dYRdtFTUyDpjPUNxlrj52OZ5i0k7X8GQr8BUu0YM8GdtNM8jGEim91vM0N
         dV4crHlSEVoKa5+3CrrXPyRKAnCVX2H733muRH3tvZ6rQIkzjmdMVdaR8zjvcdM6yxAi
         Ro1w==
X-Gm-Message-State: ABy/qLZoAtfOPWeBO7SlkB140+/ufVgT6S+ebwsw8ct9eqHwVIgSgvyG
	RQWAscToJLN2I2TVAIc+wrvh60ToLhfaulqJQo0=
X-Google-Smtp-Source: APBJJlE7RBP0m6Cdxi2m2dGUmO1cYZcOkYxJP8XD/p6rsaSHOzDWb6nGGZU9uLRgMKl0lanZNx+EbxgKTJx1XXbcCh0=
X-Received: by 2002:a2e:b4b1:0:b0:2b9:b1fb:5ff4 with SMTP id
 q17-20020a2eb4b1000000b002b9b1fb5ff4mr1360093ljm.21.1690508268189; Thu, 27
 Jul 2023 18:37:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <ZMKI8RknjjZBOaxf@google.com>
In-Reply-To: <ZMKI8RknjjZBOaxf@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 28 Jul 2023 09:37:36 +0800
Message-ID: <CAJve8o=GZnLLedT7TvCLvgd5Z3ZxJNfM6gG03Eyc+7krtMY--g@mail.gmail.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
To: Sean Christopherson <seanjc@google.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_183754_817991_B0B66AFA 
X-CRM114-Status: GOOD (  12.31  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTE6MTTigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyNywgMjAyMywgSGFpYm8g
WHUgd3JvdGU6Cj4gPiBUaGUgc3N0Y190aW1lciBzZWxmdGVzdCBpcyB1c2VkIHRvIHZhbGlkYXRl
IFNzdGMgdGltZXIgZnVuY3Rpb25hbGl0eQo+ID4gaW4gYSBndWVzdCwgd2hpY2ggc2V0cyB1cCBw
ZXJpb2RpYyB0aW1lciBpbnRlcnJ1cHRzIGFuZCBjaGVjayB0aGUKPiA+IGJhc2ljIGludGVycnVw
dCBzdGF0dXMgdXBvbiBpdHMgcmVjZWlwdC4KPiA+Cj4gPiBUaGlzIEtWTSBzZWxmdGVzdCB3YXMg
cG9ydGVkIGZyb20gYWFyY2g2NCBhcmNoX3RpbWVyIGFuZCB0ZXN0ZWQKPiA+IHdpdGggTGludXgg
djYuNS1yYzMgb24gYSBRZW11IHJpc2N2NjQgdmlydCBtYWNoaW5lLgo+Cj4gV291bGQgaXQgYmUg
cG9zc2libGUgdG8gZXh0cmFjdCB0aGUgQVJNIGJpdHMgZnJvbSBhcmNoX3RpbWVyIGFuZCBtYWtl
IHRoZSBidWxrIG9mCj4gdGhlIHRlc3QgY29tbW9uIHRvIEFSTSBhbmQgUklTQy1WPyAgQXQgYSBn
bGFuY2UsIHRoZXJlIGlzIHF1aXRlIGEgYml0IG9mIGNvcHkrcGFzdGUuCgpTdXJlLCBJIHdpbGwg
aGF2ZSBhIHRyeSB0byBjb25zb2xpZGF0ZSB0aGUgY29tbW9uIGNvZGUgZm9yIEFSTSBhbmQgUklT
Qy1WIGluIHYyLgoKVGhhbmtzLApIYWlibwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
