Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D1DD6AAE5
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 16:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+3chXQ0HEO6aws9heHSuBu832QmLPacotjt5XnD4OGo=; b=dJP3M067wqU+Sv
	oG4Yp9zIyPCXqa1enAEECUCwy+WW9PtJIJnQxFD1sE9Q73TYDQPLHGvcOOKQHAgqifAIIAFG8kiME
	ZfcuBVk+DSjlnqyrHHSaTXBpDEhtigMds6Zzwle9x2tiZ5cVQdll6rugWPz1uaKM9HA8xl+jGZNgR
	AcJStEuQA9GitbCTPJb0q/RMf/ScmPhHX8sdEs3fWH2HISV0GhZKBleiRhT+MlwNVqVM5pdNo5RM6
	9eT07VTIvcHYuhyjWwlWGxeVX7axNfuHYQYJ416WaKar/v8NbE5vptX9UqhNNABuzW6qqpxzn/m56
	OrwWBVO6m9kRGBMX1Xeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KTC-00000000Tye-0RCR;
	Thu, 02 Apr 2026 16:00:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KTA-00000000Txm-1TPj
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Apr 2026 16:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=; b=gJE56CRwpPhsJwsbM1Tkm589Ye
	CszSR7D+mjGAGUMbUKDFbibb8yNPadmDDqYHIHvmnAntDMWgmYo2b6a8ZZPV7LJXbZYJ1tFlqF6j8
	BziICFKHTvR4n8CJCCge9eAW7SLFfTT6rIyrnLpAFP5jYz3dSdTYrGx2ORwf/tAAA9u11ZAZji7uW
	ixpTHf7Ru7qLoG23xda1onWimhkoY+pJzVlgUS9niM7vmhZ5aMc9opl5mOTx6Afvr+C3pIq4XFYWl
	+bI1jd8elf14UqjFsHoaAjv0KcYriXOI+5wOuMAsm2XK8NT6jeLiGwFlOOMgXnIKD1Qv9pqmPur5j
	EnTnGukA==;
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8KT7-00000002pot-2Cdz
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 16:00:31 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-67c20ed3076so624671eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 09:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775145627; cv=none;
        d=google.com; s=arc-20240605;
        b=dzgf5EQLZ7UfoyryD99wa8/mPovmj6Evnr/EdT39D+iFmlZ4j6ksofyQa839Z7f977
         e1qpV03YNxlBmRK0NMN9SMfGYgtIQXy6kmMW1oCdZf8O3hGIDS1GhZ0KKm1fljh2WOSo
         fZdOW4D4w9c6gwk2mw1K6Hp8dVdpDW8jOd3z/8dHnLUm3IGoAz/35ulV2lFreZnZxzwH
         dXwIrLfzTtil7WOxgGq4spvBlD5qiZGqDEfhEL3Y5+9PezCdtCNDhQCUTNkovWhS5tng
         LCmWCGfWeyHq/qGKgCMiBZa+xkWIk6XGAISBUuNNG9Jf++ERUsU84A/QaQtPROwE8CBy
         gMcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        fh=eIs4VVzi3KGiLGNIMqs0qdTrx2HTO4FIPoLRcR7wJ60=;
        b=ERIfZODhThkrngpwbEaayjfm6WimeAJ0lUD+t31wSySAygY9uTmeXTG2bLf/9Gsegt
         7AKj5A8bI55Eitt1IWBg9ie+zTzBufTglKzvEo97jktM/9ZMkJWJahZVKTDRpzRNYnqK
         wT+ggC+7CSfe9xgQPT++l4O01yfSp9HELHqBSgaGdGy2g1a2i3WSVOcULCHsNzAUy9pZ
         wWseumk/zwGMNQdYcFTDwBype8VNzzsQQNkYKIvl5wa0Gyj0FFoVoOC1ofGTum98fwGg
         O2AcgVHmvSIb/AlZzFy8cnKnPYS9eA9qG0sapT3Ip09/H7pm4A7XPS/iU2gUODeOv9Js
         e1Eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775145627; x=1775750427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=XTHncYozAkL9Yl5OSyeJw2+3v2CFJzVvmWn8caMEn1hHRNfDKiGlc1zRpAvK9oWE4L
         eqmkD7O8mZoYZUk05uONIfTQAAA7hS2NC7CQNPQakL54wC+C0JY3u7oOn5lK+C5DQTZV
         TzX9AplE66LGE+OQA2P9UugD27WEik+1A5HCSTcPn0YciwoLJOnZzYm7jxVaM1uUvMq+
         njHmfqA627Q/6Cw6Gk6IEQ0H8nB900FD/AAgBJPCpVGd9R6mBlB4irsSgthL2GVKIk3n
         t0qIdhVaQ7M+QGxe/7jOxdtJoaJNi7IYaMU84+3URQK3TjP3pQ5P76SjEwhRKFmM9UR+
         /79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145627; x=1775750427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtM2gelQtlkDLtUyeOY/RQAEzxS8kBtRhg00qUrjMDQ=;
        b=f/Pa7C9jgf12nU9ZdmKQbmhi0XP2JRT8KSm8jqIrejXSzFTUUnof9iXKcczhgICZ+l
         9qaD8CO1kEPOimcRwCXaoQLQpdo1bfpPgZqXGivUajO7txu8xDpTIQ1ZUZqTPHe3qpY5
         8zx/GL3URoxAXxDJM13YWnrGfyFXW39bbIMhXI1I3WsUsKBOE4j1DXgPDjMYqI/3HiKE
         Uym+5lmaMTCq9S3+Y8ogTLSnNnnRLViM53Qoy6acHLZxr1udstsGJf6maKH8UjfDlDMo
         jmmBiDAFYkbFIlv3LnjNoXP5t6ZawXCchCoY+AhtB/Wx9LPIbsbvDG8BMoNtVRnaMKOD
         QN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYTpcc+lLc6qFPI8P4bt1mnk1IMZ++NOTPu8FM0p1GvupdBCzzwE5vDpNB3wKc8E4hkkVMZkudDLwWJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu3kiWb9LRHAKnRJTgzorMdhW0lt9AuYSCugLvS2ZYxvzxmRfY
	yh87Z2t52KwQDbKWDQdHru16IbpTzGP8RDXxB+7go2DdTervuIwzweRpItOEo8C2MDpdk0k5Tbe
	aPtW9rhnHo0o52Hiz5WsWabtGMWAVm0TwXvw/yEtEIw==
X-Gm-Gg: ATEYQzyhZMH2iDIePvmg+Z+UsPZJOQKgBMcEhBYObOKFF9Xaj1ePzNaaesD+Vdieo1X
	FpSoah5/xa1twhTyQx9cm1FII5ro8zyUbxvfCTBwRcqym8kiHZJbhwRxvv3J5Iq/9xmI59I6E4t
	ewUu27zOzyRf88zqZRCI3n2SEMrNJI75mDVM4w5iiQvsrs8LYJphcXtbZEA9LBe/KyE0t1AXALK
	uxT5HbmQXj9IIppWCV8ODX72xpQ4Kjov2dEXciKILz3TpZoJh84NcNHcnl8IvXYrkKhyA3CI2Au
	9O/UsJ4gSQshzMaPZlhhgpEItkCKmHMbo3JjCCvdkS2jlTtXONZwG24gIX/0x8Taj9YRWuj+UUL
	a6fr+sLQV6i0m1JaTUs1zzIPn/Q==
X-Received: by 2002:a05:6820:1992:b0:67e:16b4:aa07 with SMTP id
 006d021491bc7-67fabd02b7emr4353699eaf.61.1775145627522; Thu, 02 Apr 2026
 09:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
In-Reply-To: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 21:30:15 +0530
X-Gm-Features: AQROBzAd1C5PJZt0gGUQZy-ZILEi3rG_cTSfqG4yBNpRYZjiqBUpj0qc4P6OGJA
Message-ID: <CAAhSdy0FP=-KQV_QaMVWJz9gwEzm2BdVH857MWx28Jej+S+vMw@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_170029_758479_B86E41F8 
X-CRM114-Status: GOOD (  12.83  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAzOjUz4oCvUE0gTWF5dXJlc2ggQ2hpdGFsZQo8bWF5dXJl
c2guY2hpdGFsZUBvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IGt2bV9hcmNoX2hhc19kZWZh
dWx0X2lycWNoaXAgaXMgcmVxdWlyZWQgZm9yIGlycWZkX3Rlc3QgYW5kIHJldHVybnMKPiB0cnVl
IGlmIGFuIGluLWtlcm5lbCBpbnRlcnJ1cHQgY29udHJvbGxlciBpcyBzdXBwb3J0ZWQuCj4KPiBG
aXhlczogYTEzMzA1MjY2NmJlZCAoIktWTTogc2VsZnRlc3RzOiBGaXggaXJxZmRfdGVzdCBmb3Ig
bm9uLXg4NiBhcmNoaXRlY3R1cmVzIikKPiBTaWduZWQtb2ZmLWJ5OiBNYXl1cmVzaCBDaGl0YWxl
IDxtYXl1cmVzaC5jaGl0YWxlQG9zcy5xdWFsY29tbS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4g
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgfCA1ICsr
KysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IDUxZGQ0
NTVmZjUyYy4uMDY3YzZiMmMxNWIwIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gQEAgLTU2NiwzICs1NjYsOCBAQCB1bnNp
Z25lZCBsb25nIHJpc2N2NjRfZ2V0X3NhdHBfbW9kZSh2b2lkKQo+Cj4gICAgICAgICByZXR1cm4g
dmFsOwo+ICB9Cj4gKwo+ICtib29sIGt2bV9hcmNoX2hhc19kZWZhdWx0X2lycWNoaXAodm9pZCkK
PiArewo+ICsgICAgICAgcmV0dXJuIGt2bV9jaGVja19jYXAoS1ZNX0NBUF9JUlFDSElQKTsKPiAr
fQo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
