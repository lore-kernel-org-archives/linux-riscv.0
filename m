Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA17C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0sG8dK7z284M2iQFmcX2yzvczsZRxjYdpUIi0REJCS4=; b=LOQDvscVbqV41w
	9yjq4PsOTmYvw170dld2gPy21/VWApQeRvKhYwci911KldC30ZzQyiMIYuS71diJqOgoURjSpi6/b
	J+MpbEg/JCCPOVR9E3nW2bggmYsOeLttUMpK+0Fagnm2nEKTzvK62cP13dGfk2JKbGjtQ12JpZhNt
	8FgkYzCsx3Upn+y+ky/LDQInkWe2zFx9IwEmXV7SKRc+PVFqeQ8AEkSc8j/lCNCLYzrnLAF8UkPcv
	syalV6AigcBPJp08N+SLCm/26kqeXr8+ZyMzAC4/tuePDDhBYTrlYheW6O1rTy4xqHJOP2t1ubvRm
	55yxL0O2lv2NmUdqYzsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51rn-00Epwp-E8; Tue, 13 Dec 2022 09:46:27 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51rk-00Epoy-RN
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 09:46:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h10so14993554wrx.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 01:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6HCpfsDxKsbRWDniMvTsAcm6k9bqzut02W2Q+dej5cA=;
        b=Ex6palua+CAb8sAnNRSs8QCJJYJy/CXh6vu8iuxELmuLYIDrF2/RExi4CYvGIwjJVb
         0Hw8S/7m4UBgKH+bGVe+zuk8w2F7mFhNNeHeX6LVfeyQY5x3cnou27cfkigKZrENvKBz
         LX8clCm2xYOgwgxlVTiZEEtbOr3jJ1dLVrGoE6s3UPIvxdMR9U2X4lxGEf6qw9kIOdYD
         K+ksfEaTBuwkypOmNmDFRZz5c/4gWAgs5j5mnkV4YFuQmGeJELWnGZ41hrzsIeZ+TXtt
         quGHmeCbmOcVfzAXWOBWrrgDYUWcXplwtQ/ZI6tst+MM7yleBo+Dyn7REujufWRh+W+H
         fTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6HCpfsDxKsbRWDniMvTsAcm6k9bqzut02W2Q+dej5cA=;
        b=2DFN0VZXbP2DqgJYJZTyskXTG6ZXpm0bb66ZZgAe9DUcY23f5duRlBwn9rP87AuKhE
         Eu/KB5o0r9qWuOzlVOKSb8wmFL+R67+W32S/SCmVbZlyVGfKxLEMBFUFI62ObAGn8oSm
         vNmu+KTqsxlB9wmPcv6okVGIywpLy2gVlmSsOYz8QWXAJHRdcpYJpC6alzH9F/wrWXal
         PKwcOYPB65i2t5vcWNLx2mqKx15EX58PxOlAwgnJDlpIDV2b18fbJB/B7/R0iOnqjX+I
         nr8QyfSzBM+7hi9TPbIrKqWB8DrRTq7zOSuUryGb9S9fmZntrKD5t/NNSTA/DHqZ/sU+
         qVtQ==
X-Gm-Message-State: ANoB5pm4cEEc/4I/L/IdiLzrT6mo+xZKH2b7boIFsamleidXRvR2SrV1
	O5ZJhTxxJlXMECS37R862Z8tHemLZBpHHFVQlPM=
X-Google-Smtp-Source: AA0mqf62OayQR32aHZW7SQ2L2Smz6e0kOzvNE3xqgzO1KHXWbyXt8wEW/lnneYLd3l0I3gIKF9q7mQ==
X-Received: by 2002:a5d:5a19:0:b0:242:8177:6291 with SMTP id bq25-20020a5d5a19000000b0024281776291mr15276191wrb.1.1670924781185;
        Tue, 13 Dec 2022 01:46:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id j13-20020a5d618d000000b002422816aa25sm12963005wru.108.2022.12.13.01.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:46:20 -0800 (PST)
Message-ID: <84c81594-0106-536c-5e04-1afb24953727@linaro.org>
Date: Tue, 13 Dec 2022 10:46:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 03/14] KVM: selftests: Fix divide-by-zero bug in
 memslot_perf_test
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Tom Rix <trix@redhat.com>,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ricardo Koller <ricarkol@google.com>,
 Aaron Lewis <aaronlewis@google.com>,
 Raghavendra Rao Ananta <rananta@google.com>
References: <20221213001653.3852042-1-seanjc@google.com>
 <20221213001653.3852042-4-seanjc@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221213001653.3852042-4-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_014624_903010_5AEE5702 
X-CRM114-Status: UNSURE (   8.95  )
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

T24gMTMvMTIvMjIgMDE6MTYsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4gQ2hlY2sgdGhh
dCB0aGUgbnVtYmVyIG9mIHBhZ2VzIHBlciBzbG90IGlzIG5vbi16ZXJvIGluIGdldF9tYXhfc2xv
dHMoKQo+IHByaW9yIHRvIGNvbXB1dGluZyB0aGUgcmVtYWluaW5nIG51bWJlciBvZiBwYWdlcy4g
IGNsYW5nIGdlbmVyYXRlcyBjb2RlCj4gdGhhdCB1c2VzIGFuIGFjdHVhbCBESVYgZm9yIGNhbGN1
bGF0aW5nIHRoZSByZW1haW5pbmcsIHdoaWNoIGNhdXNlcyBhICNERQo+IGlmIHRoZSB0b3RhbCBu
dW1iZXIgb2YgcGFnZXMgaXMgbGVzcyB0aGFuIHRoZSBudW1iZXIgb2Ygc2xvdHMuCj4gCj4gICAg
dHJhcHM6IG1lbXNsb3RfcGVyZl90ZVs5NzYxMV0gdHJhcCBkaXZpZGUgZXJyb3IgaXA6NDAzMGM0
IHNwOjdmZmQxOGFlNThmMAo+ICAgICAgICAgICBlcnJvcjowIGluIG1lbXNsb3RfcGVyZl90ZXN0
WzQwMTAwMCtjYjAwMF0KPiAKPiBGaXhlczogYTY5MTcwYzY1YWNkICgiS1ZNOiBzZWxmdGVzdHM6
IG1lbXNsb3RfcGVyZl90ZXN0OiBSZXBvcnQgb3B0aW1hbCBtZW1vcnkgc2xvdHMiKQo+IFNpZ25l
ZC1vZmYtYnk6IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgo+IC0tLQo+
ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL21lbXNsb3RfcGVyZl90ZXN0LmMgfCAzICsr
Kwo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
