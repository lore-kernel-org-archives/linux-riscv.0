Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB73EF8FE4
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jtu3uR36SZzobHL8fo6jqDdvVf3yzdSZP6VcbiofuTs=; b=AnEUMNiGw9F7SE
	IAlMNm6UgWHuanOjq68f5x4G8lgnciIgatbxEKPxtQUrwtv0ZZRoGcK/GIljQTxn/pGWOTBp+GIFM
	mrui0ph32QK0E7TIpa1rcirGEz/UdLIFz8TiDIGN6xoLVR0WckxxuNWbt57+aGpGBm7xPTWJdBBg3
	si3OKuDsAxGXG+8ci9d+aRhvyYie1IvzfaXITfnBTI70WU6OISiRD/P8ejXpnuaIodz7RS1rdY3SN
	/ugX6ExQ1Am7GCS7EVuvB7iMAOXfG8t5bsrfy+FMd/7ThPp4gTDH0Zsh+xg8FUiHxgNNR1YiAIK4g
	ygBLJpXJcErUuyF+gyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTy-00000002Iuu-1FI5;
	Thu, 05 Mar 2026 17:27:30 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCTw-00000002It6-08GW
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:27:29 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3870df2331aso69217971fa.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731646; cv=none;
        d=google.com; s=arc-20240605;
        b=OkqaVZGG5XpYyaU4gVEwgpKeQQooqz/TWGjJnTkppux7XxY+dZaKRzYyIagnkBoFOI
         1Ktcq/hbo8JO7p/oRBSPBsw2OsoJDlquijs8CZHY4g9RdiXVr5i3dRnKUS/mQDbmU2a4
         FW91CVZPhHi+lZbjBkSEJc4sKH4PjgFOlFMHXpxy1/27hDufUb90zaYwqRAZBKkoF9Cp
         Nz1vx0Cm0uLHC0zY2O8w9DyrpLoWuuRWsK9xDkywztYdtrdhPnw0XrI4F2OvsVotSE16
         3TBB3vViAElTw5eykdJ05N3ukMatPuWRxK9lqpPFKcs4BBF0Mk//Q1z/G6eJD447dTX4
         bq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        fh=2TkdPTRPVgl+eEbCYt7PRlqHTMSjcIWHFnqEa6hjalc=;
        b=AljVGNsEUTpvhq5gE13oSsNj8Xf4/TjRY8/qIUJAm7xeHt1zOitRdqTbPmXUJh1BKM
         vMjnkZY1BcQ9H582nxlLkDBPwXwcaKO3AO4x819B+Kjubp45YUa1CVoIUQBCFWcdZprc
         WUS1EFGvKwETPCidL7COObXoUNaJCnI1GqubqmBrXREjJIzgBuyOpebFuAS4iEbSXT90
         D+BDVti5N71sTkI7AAv2ctS5niK5GkEDv7FDdjFwAilJrXfV0gLo1/QyJcGeor1N6eUk
         nylEIWE+/xndh+NRhR2PeXkeLdvNvWBM2tVIcgFGcCuuCtFsAmUmz0D5EeQSVY03KrLN
         FfGg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731646; x=1773336446; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=hO8GssZADpS2+Qu7DYjCmTsWiiRghESDYG+7q/J3yiUluTY5e7lG0jtPPWqmbpgGiR
         7OAduTwpTk+Uka56yvW/3Omr2K2wZROGp4NLK2CZtCKwJvki8PATw9JY+kgG/Gwjyvoi
         T03sTZfhiptkP9auyWU9TU6wFV/+GYsAAsA3PwQjZR9+cMCZ6oIKbF11VO21QEL8kBKh
         oV3er1Je0BmceEIUoxRK0dfIyrwH1+6kGEDNuIG7btcKogAI506C0fmK0T+n37Dq1Wew
         /MJqQD2UcI9qOdsiqBSCb+jnTM+7FxnYGjZz4wUh3rrIJxDt9flcDwnVEnSFlxL7x2PN
         xamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731646; x=1773336446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=jX77rWFoq2dA3wrRjNfamvDz1r/BKIecrqZy53jy5MevZyJWmoUXb6xGjAAC8BYL5S
         56qSCFRmTuKCHYQhP2NNaJoy1/xIxyT0in6Xxoy4oI7jcHxeu59iv1qeFaJnCF4kp4gS
         Ljtb8sq9L1JLkAsswITghHnwcC9HQzR/OwQgZAdmeyr+nzkrrR2toGsRr43sgtrpVlQA
         IiCniVNPELG5EvDdIOX82zOEA1TB6nzGrx81wv9iO8ZCzOn1O3XIPRsSZMFeT2rXgkv1
         9xJROvXAD5CEPiKaHo1Axhq4z3ZIWE3YknpoMRh4YOxyGQm+R+17vq9boQSYUCI2TmnU
         GUHA==
X-Forwarded-Encrypted: i=1; AJvYcCWOrOGKiaMMlWDahCwOiyE309e/CncpdDfbYtV+0efMtQMjgh3mUyMzVHii5mROAb2YopveoSb4niXIWw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzoSViZ+9PK0n8xPmEwaae83FxqiVsz5OoIKGM4F7hH9Xcm5IR
	nHjzjVbiIF22luHZ4FHms3g5zamrGoF5UZAKIXE+HQy4nh/1M7TF7rV2iOGiDsh6jRh2giu2CKr
	QGmrQC0SjL6ey64G+k8Tx5JvDQmX1Hc3nXMt6PFC5
X-Gm-Gg: ATEYQzynT+WuhGzRI6W3+kQcMLPcNTd/Speq2Ljl+at+V5xDPqdjhdPD7WswinB8A9U
	lY0m3ZUa+2f4Ss3nZRvngWg1V2XH4kt6jTeabTIQddFFnKMKtWaUeBwwceQ5y53sn2k5RMhRHzH
	W8iG/7G7nY6Cl/1Je4Lab4W36qMqGUsNeJ5KQIWrH8oz2RXwXzjIO/OmmeLcSMurBhB120OMjWl
	rrUA9uVV13ezQ7xeDZ92zWh2BKnYWn4hA0jx0pdwN0xGKXB+VkVUqJI0ADuIJt56qQn+a6QZGm1
	4odfk4sP
X-Received: by 2002:a2e:9797:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a35158513mr8005261fa.8.1772731645158; Thu, 05 Mar 2026
 09:27:25 -0800 (PST)
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
 <aam7JsCyQ5Oacvl5@google.com>
In-Reply-To: <aam7JsCyQ5Oacvl5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:57 -0800
X-Gm-Features: AaiRm51o6Q3ZTz6ECMDT5TdlqFdcggDf0j5vT0TJnm45bgTm8VbA0ynEnVZFATE
Message-ID: <CALzav=fV4NX=pxKfX7hH+tO3FBNcSF1KstXsKqprpCj64Ndx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092728_081741_DC02A71F 
X-CRM114-Status: UNSURE (   7.25  )
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

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCA5OjE54oCvQU0gU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2Vh
bmpjQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjAsIDIwMjYsIERhdmlkIE1h
dGxhY2sgd3JvdGU6Cj4gPiAtc3RhdGljIHVpbnQ2NF90IHByZWFkX3VpbnQ2NChpbnQgZmQsIGNv
bnN0IGNoYXIgKmZpbGVuYW1lLCB1aW50NjRfdCBpbmRleCkKPiA+ICtzdGF0aWMgdTY0IHByZWFk
X3VpbnQ2NChpbnQgZmQsIGNvbnN0IGNoYXIgKmZpbGVuYW1lLCB1NjQgaW5kZXgpCj4KPiBJIHRo
aW5rIGl0J3MgYWxzbyB3b3J0aCBjb252ZXJ0aW5nIHRoZSBmdW5jdGlvbiB0byBwcmVhZF91NjQo
KS4KCkdvb2QgZXllIDopLiBZZXMgYWdyZWVkLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
