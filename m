Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40763C77B6F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 04:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9trHQCVmyglLagCEWRiYS6faj0pb2w7DB0HHBr7zDaM=; b=aoOJ4r27mZm5MO
	n08iO6D8LxChPVj13npO6rAsYsDmnlcdoCCew0mIP5rDKtuxkz4Y/CXvmE5Zmx7BtBlwoNA2KyfEG
	kc1JwWM61vAxCj/uxrEqnZurVBjNGa0tKdNCDGaCSUcCFiIeWBBPUPBVqOYyEg6gmPferOUhQI69I
	7Sjk8gfJmToykBFRgznnvpWoIWszNRADdjHGVJvUzTA8AIsPuTIFtRt2Utwk+MOP5vn392A6Sjfr6
	HCONMDdhZ/HwsXPGjBZZ0WvpqQcB4+9A/FRDzTFqJq0JLIu4ozLwqWVMBHN76CxxBeqTHcqevKvGc
	axjQ5+VbdFr6NqVQsoHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pljEb-00EYY0-1l;
	Mon, 10 Apr 2023 04:34:29 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pljEW-00EYWG-1P
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 04:34:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-635df3bd6e9so1002101b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 09 Apr 2023 21:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681101261; x=1683693261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wo/NLYM68CpVej7TFrEwhf6OkmmykabPIEmuzOcGQhk=;
        b=14ynvSGMjNFozUEgNPf5yBPQdprMlno4GnJrckN9NKprlViZIhNxxhN+f827VAuy1q
         xTJdqsEWvAxss3rv3YkvvUiGOM/KAiDibpbl0fr9nq2K6FGQrFdYZNr79ZVV37OrqjCY
         yOINUEMPyaQksnmOmcwjlbYCyYPvYji/7ZpU41pQRlDaWVovmxudkH49/g12crFxYvXC
         OpSK2bG0bF5NUz+BCbClWhGq24I5+PSrqoXIggZa1XWhsu+DqcFrFNuiT2UNJgvqRQZB
         nTCxHZpXU/Nsj0PFIeThbrBkVXfwGDvE9LqKheqwp4tJvZZZsK+6bqAMhqoBLxJOYZE6
         6DSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681101261; x=1683693261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wo/NLYM68CpVej7TFrEwhf6OkmmykabPIEmuzOcGQhk=;
        b=Z3lhnDkZE/z5ZZfZvq11m5SPH5RFyRQoG/7F4Ry6RPhDSbdQddx/6E0r0dRxA42yWF
         iYhIca9b2F2IMfhHcPff56vh1ShbM3993RLo7CJDKL7Vh2y7r6YyBebLfYgDM4oY9lYk
         1yI3LKF2ZzFlVPBCsnHr8Of4Jpf1Jivl+/a+NRewWkldAtc4jVg2Wwg+rgB6q+g/BNNG
         480HOMNWtVoNClWTJjVbw0GDypUrQlQywXBky3vxoJf3e7P3LKh/R8uJdRMFPI5yyJAn
         14O1esHA75KlfHCpgemFKBcmLI0C7BtJtuiipBWnaSAqkQHKVbdqHM4EE6ZUwK44kamM
         WO4A==
X-Gm-Message-State: AAQBX9cF2WQCK1C3zGoXU9dqYq9YwakMrOskL8I0RkscVsUTCXgdleGT
	TuLV14Lxj3eavr9Cas85aD/j/lrRa/Bk9/OvfZqiPA==
X-Google-Smtp-Source: AKy350Z2pVohIIfC8uOSvebyeFmf1J41yDqHZ+iw/kR/cSkcgoer36lMoJOfnE61nWFF+haa+PKKiA==
X-Received: by 2002:a62:180b:0:b0:628:1862:dda6 with SMTP id 11-20020a62180b000000b006281862dda6mr9491271pfy.17.1681101261451;
        Sun, 09 Apr 2023 21:34:21 -0700 (PDT)
Received: from x1.. ([2601:1c2:1801:d250:45c0:94f2:eea7:6dc3])
        by smtp.gmail.com with ESMTPSA id x24-20020aa793b8000000b00634a96493f7sm2394411pff.128.2023.04.09.21.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 21:34:20 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	James Morse <james.morse@arm.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 0/2] RISC-V: Detect Ssqosid extension and handle sqoscfg CSR
Date: Sun,  9 Apr 2023 21:36:44 -0700
Message-Id: <20230410043646.3138446-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230409_213424_636024_8532E4CD 
X-CRM114-Status: GOOD (  15.13  )
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

VGhpcyBSRkMgc2VyaWVzIGFkZHMgaW5pdGlhbCBzdXBwb3J0IGZvciB0aGUgU3Nxb3NpZCBleHRl
bnNpb24gYW5kIHRoZQpzcW9zY2ZnIENTUiBhcyBzcGVjaWZpZWQgaW4gQ2hhcHRlciAyIG9mIHRo
ZSBSSVNDLVYgQ2FwYWNpdHkgYW5kCkJhbmR3aWR0aCBDb250cm9sbGVyIFFvUyBSZWdpc3RlciBJ
bnRlcmZhY2UgKENCUVJJKSBzcGVjaWZpY2F0aW9uIFsxXS4KClFvUyAoUXVhbGl0eSBvZiBTZXJ2
aWNlKSBpbiB0aGlzIGNvbnRleHQgaXMgY29uY2VybmVkIHdpdGggc2hhcmVkCnJlc291cmNlcyBv
biBhbiBTb0Mgc3VjaCBhcyBjYWNoZSBjYXBhY2l0eSBhbmQgbWVtb3J5IGJhbmR3aWR0aC4gSW50
ZWwKYW5kIEFNRCBhbHJlYWR5IGhhdmUgUW9TIGZlYXR1cmVzIG9uIHg4NiwgYW5kIHRoZXJlIGlz
IGFuIGV4aXN0aW5nIHVzZXIKaW50ZXJmYWNlIGluIExpbnV4OiB0aGUgcmVzY3RybCB2aXJ0dWFs
IGZpbGVzeXN0ZW0gWzJdLgoKVGhlIHNxb3NjZmcgQ1NSIHByb3ZpZGVzIGEgbWVjaGFuaXNtIGJ5
IHdoaWNoIGEgc29mdHdhcmUgd29ya2xvYWQgKGUuZy4KYSBwcm9jZXNzIG9yIGEgc2V0IG9mIHBy
b2Nlc3NlcykgY2FuIGJlIGFzc29jaWF0ZWQgd2l0aCBhIHJlc291cmNlCmNvbnRyb2wgSUQgKFJD
SUQpIGFuZCBhIG1vbml0b3JpbmcgY291bnRlciBJRCAoTUNJRCkgdGhhdCBhY2NvbXBhbmllcwpl
YWNoIHJlcXVlc3QgbWFkZSBieSB0aGUgaGFydCB0byBzaGFyZWQgcmVzb3VyY2VzIGxpa2UgY2Fj
aGUuIENCUVJJCmRlZmluZXMgb3BlcmF0aW9ucyB0byBjb25maWd1cmUgcmVzb3VyY2UgdXNhZ2Ug
bGltaXRzLCBpbiB0aGUgZm9ybSBvZgpjYXBhY2l0eSBvciBiYW5kd2lkdGgsIGZvciBhbiBSQ0lE
LiBDQlFSSSBhbHNvIGRlZmluZXMgb3BlcmF0aW9ucyB0bwpjb25maWd1cmUgY291bnRlcnMgdG8g
dHJhY2sgdGhlIHJlc291cmNlIHV0aWxpemF0aW9uIG9mIGFuIE1DSUQuCgpUaGUgQ0JRUkkgc3Bl
YyBpcyBzdGlsbCBpbiBkcmFmdCBzdGF0ZSBhbmQgaXMgdW5kZXJnb2luZyByZXZpZXcgWzNdLiBJ
dAppcyBwb3NzaWJsZSB0aGVyZSB3aWxsIGJlIGNoYW5nZXMgdG8gdGhlIFNzcW9zaWQgZXh0ZW5z
aW9uIGFuZCB0aGUgQ0JRUkkKc3BlYy4gRm9yIGV4YW1wbGUsIHRoZSBDU1IgYWRkcmVzcyBmb3Ig
c3Fvc2NmZyBpcyBub3QgeWV0IGZpbmFsaXplZC4KCk15IGdvYWwgZm9yIHRoaXMgUkZDIGlzIHRv
IGRldGVybWluZSBpZiB0aGUgMm5kIHBhdGNoIGlzIGFuIGFjY2VwdGFibGUKYXBwcm9hY2ggdG8g
aGFuZGxpbmcgc3Fvc2NmZyB3aGVuIHN3aXRjaGluZyB0YXNrcy4gVGhpcyBSRkMgd2FzIHRlc3Rl
ZAphZ2FpbnN0IGEgUUVNVSBicmFuY2ggdGhhdCBpbXBsZW1lbnRzIHRoZSBTc3Fvc2lkIGV4dGVu
c2lvbiBbNF0uIEEgdGVzdApkcml2ZXIgWzVdIHdhcyB1c2VkIHRvIHNldCB0aHJlYWRfc3RydWN0
LnNxb3NjZmcgZm9yIHRoZSBjdXJyZW50CnByb2Nlc3MuIFRoaXMgYWxsb3dlZCBfX3Fvc19zY2hl
ZF9pbigpIHRvIGJlIHRlc3RlZCB3aXRob3V0IHJlc2N0cmwuCgpBIGZvcnRoY29taW5nIFJGQyBz
ZXJpZXMgd2lsbCBlbmFibGUgcmVzY3RybCB0byBzdXBwb3J0IHN5c3RlbXMgdGhhdAppbXBsZW1l
bnQgQ0JRUkkgYW5kIHdpbGwgcmVmZXJlbmNlIGEgUUVNVSBicmFuY2ggdGhhdCBpbXBsZW1lbnRz
IENCUVJJLgoKTk9URTogQ0JRUkkgd2FzIHByZXZpb3VzbHkga25vd24gYXMgQ01RUkkgYW5kIHRo
ZSBnaXRodWIgcmVwbyB3aXRoIHRoZQpzcGVjIGhhcyBub3QgeWV0IGJlZW4gcmVuYW1lZCBbNl0u
CgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LW5vbi1pc2EvcmlzY3YtY21xcmkvYmxvYi9t
YWluL3Jpc2N2LWNicXJpLnBkZgpbMl0gaHR0cHM6Ly9kb2NzLmtlcm5lbC5vcmcveDg2L3Jlc2N0
cmwuaHRtbApbM10gaHR0cHM6Ly9saXN0cy5yaXNjdi5vcmcvZy90ZWNoLWNtcXJpL21lc3NhZ2Uv
MzgKWzRdIGh0dHBzOi8vZ2l0aHViLmNvbS9wZHA3L3FlbXUvdHJlZS9zc3Fvc2lkX3Y4LjAuMC1y
YzEKWzVdIGh0dHBzOi8vZ2l0aHViLmNvbS9wZHA3L2xpbnV4L2NvbW1pdHMvc3Nxb3NpZF9zcW9z
Y2ZnX3Y2LjMKWzZdIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1jbXFyaS9tZXNzYWdl
LzQxCgpEcmV3IEZ1c3RpbmkgKDEpOgogIFJJU0MtVjogQWRkIHN1cHBvcnQgZm9yIHNxb3NjZmcg
Q1NSCgpLb3JuZWwgRHVsxJliYSAoMSk6CiAgUklTQy1WOiBEZXRlY3QgdGhlIFNzcW9zaWQgZXh0
ZW5zaW9uCgogYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysr
KysrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgIHwgIDggKysrKysrCiBh
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAgIHwgIDIgKysKIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmggfCAgMyArKysKIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcW9z
LmggICAgICAgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc3dpdGNoX3RvLmggfCAgMiArKwogYXJjaC9yaXNjdi9rZXJuZWwvY3B1LmMg
ICAgICAgICAgICB8ICAxICsKIGFyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYyAgICAgfCAg
MSArCiA4IGZpbGVzIGNoYW5nZWQsIDc2IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fvcy5oCgoKYmFzZS1jb21taXQ6IGQzNGE2YjcxNWEy
M2NjZDljOWQwYmM3YTQ3NWJlYTU5ZGMzZTI4YjIKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
