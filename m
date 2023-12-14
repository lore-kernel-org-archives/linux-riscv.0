Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86849C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vda/KblSBCwXJNeh5sD0SYyL8TgXwSp5XTmNOwDNacU=; b=GbQ2osWnUR1fm8
	J66kcjBw70nmxD5DXTM5CcJ1TPWGwWcND8obd+1yXzxj5LZh/xCQMeDYNXjJD9RyYiW438p6kfF+5
	x7OyIZV3CE1TW8bWgWYj68k0TwlxgmYYV8SYdy/MOBRylA/OJVBK/pO9PlPPPsrTP8rirpi+o4O2Y
	YnLkD/LqyHz3Z7pCzYAkuBN6xcfgRN9ml/4XpgV9FPR3IrR41jjxTeFHifvqkeG1wGAmLR70PNAsa
	IDDwpU2e1PakuUSM3m9oK2CHoOSTseZ24aNRllP4eT+53F4w9S4PHDO7nj3bA00pjsbQK557Nbrg2
	kZCME9E4U7xNe5dkZRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo6B-000jGU-2K;
	Thu, 14 Dec 2023 15:58:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDo68-000jFp-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 15:58:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d307cf18fdso28787375ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 07:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702569479; x=1703174279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofzx+PtD9NebQ35OrFIzznCWiX3/O4uzvKbDVCH/QBs=;
        b=QaD91XhhsiKJcKZjI7E0SHVrAGc5YLsNW0jkmMq4iJPa22/5VKYfEncwLS2ojjlehL
         zbVbX6l/9tar0ovda/ABjp4RDUIsd1hOb/FHD/zoRkSKznAS2CL+cXQm882C/ck4Wn4m
         3zhVAk7fAxs9AvhszIkMV0T9YuQ9UD50O+ONRFGpSEOyxD/JAJuqJZStRK7JznmtYIRM
         aKb0ZxPH1lJnJ+VQYk0YV2xwq6v9QEcuvnvXz3Mhpxm8cufdFZpqWNpL5c1oVT5MsIGF
         R/LhDU4fZZ1bfnQK/hlGKwvtjEgu1+tQLA6jv/VMs876pUTUfO5sRrQRqJ/3v9NckqBs
         fRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569479; x=1703174279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofzx+PtD9NebQ35OrFIzznCWiX3/O4uzvKbDVCH/QBs=;
        b=DD4z+ZthqLyUfWg4TMBhvE+1Z5uFjI0X9ClQnDMJYx39SaWEbCMEp71CFVVbLCqo5V
         cM4pUsuPtz6EhZTdQcjYkqQZebmkygmfR7nZk2unwcGX3KkjjInSu/UmOaBuCOeZF2ph
         mhvvcWS5uQQoVeaA7x/st8HqaEoIkjKZpP1jm/2suGDJqn0xVmKpaXcqYRxETCf57o5e
         4zHeOFwKhFeuRgZtoXC4RcS2RgsosPH7QKbEBIdhENxSeGkYcXSD0sxPG0Tzx0JqZl5A
         ZrhaS2TiwXlfWcIlvPgxXjebRjKA+yS9oRF/rRoISMQyl1xRubd3qek929IR50VKNeiL
         6kaQ==
X-Gm-Message-State: AOJu0YwiaQlI3x1kAQxg1aMhOiQcI1LX5VXyAAehY0nm7ZTUg6NU8ZMq
	gR9tQOxQ8yXG0YcSXluR+Ft69xcdDpfbcND6l89ffHs4JSeojZcDz9yenttodONb6vfeQA7KtLf
	PpW3d5i7pHfK1eZscn5b9tcW0E1t3eVU2Nzh0vnp0igtKjQATHSQStr+P7Jwwg09/+NK0LFGJ5s
	tpoaCh1sL8dRHY
X-Google-Smtp-Source: AGHT+IE8hdgvVVSU8e7X0o4TnMpNNfqHCE+eG8XEWM2JNwTjlan4ICN60f7qYrnQkQLVncfEYyGP0g==
X-Received: by 2002:a17:902:e852:b0:1d0:6ffd:ceaf with SMTP id t18-20020a170902e85200b001d06ffdceafmr6714006plg.104.1702569479041;
        Thu, 14 Dec 2023 07:57:59 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902e98400b001d35223d0besm3320799plb.251.2023.12.14.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 07:57:58 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	charlie@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [v5, 0/6] riscv: support kernel-mode Vector
Date: Thu, 14 Dec 2023 15:57:15 +0000
Message-Id: <20231214155721.1753-1-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_075804_249992_7558179B 
X-CRM114-Status: GOOD (  14.64  )
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

VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBmb3IgcnVubmluZyBWZWN0b3IgY29kZSBpbiBr
ZXJuZWwgbW9kZS4KQWxvbmcgd2l0aCB0aGUgc3Vwb3J0LCB3ZSBhZGQgc29tZSBWZWN0b3Igb3B0
aW1pemVkIHJvdXRpbmVzLiBBbmQKcHJvdmlkZSBhIHNpbXBsZSB0aHJlc2hvbGQgdG8gZGVjaWRl
IHdoZW4gdG8gcnVuIHRoZSB2ZWN0b3JpemVkCmZ1bmN0aW9ucy4KCldlIGRlY2lkZWQgdG8gc3Bs
aXQgdGhlIHBhdGNoIHNlcmllcyBpbnRvIDIgcGFydHMuIFRoZSBmaXJzdCBwYXJ0CmNvbnRhaW5z
IHJ1bm5pbmcga2VybmVsLW1vZGUgVmVjdG9yIHdpdGggcHJlZW1wdGlvbiBkaXNhYmxlZC4gVGhl
IHNlY29uZApwYXJ0IHdpbGwgYWRkIHN1cHBvcnQgZm9yIHJ1bm5pbmcgVmVjdG9yIHdpdGggcHJl
ZW1wdGlvbi4KClRoaXMgcGF0Y2ggaXMgdGVzdGVkIG9uIGEgUUVNVSB3aXRoIFYgYW5kIHZlcmlm
aWVkIHRoYXQgYm9vdGluZywgbm9ybWFsCnVzZXJzcGFjZSBvcGVyYXRpb25zIGFsbCB3b3JrIGFz
IHVzdWFsIHdpdGggdGhyZXNob2xkcyBzZXQgdG8gMC4KCnYzIG9mIHRoaXMgc2VyaWVzIGNhbiBi
ZSBmb3VuZCBhdCBbMV0KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAx
OTE1NDU1Mi4yMzM1MS0xLWFuZHkuY2hpdUBzaWZpdmUuY29tLwoKUGF0Y2ggc3VtbWFyeSAob24g
Y3VycmVudCBvcmRlcik6CiAtIFVwZGF0ZWQgcGF0Y2hlczogMSwgNAogLSBOZXcgcGF0Y2g6IDIs
IDUsIDYKIC0gVW5jaGFuZ2VkIHBhdGNoOiAzCiAtIERlbGV0ZWQgcGF0Y2g6IFBhdGNoZXMgcmVs
YXRlZCB0byBwcmVlbXB0X3Ygd2lsbCBiZSBzZW50IHNlcGFyYXRlbHkKCkNoYW5nZWxvZyB2NToK
IC0gUmViYXNlIG9uIHRvcCBvZiByaXNjdiBmb3ItbmV4dCAoNi43LXJjMSkKQ2hhbmdlbG9nIHY0
OgogLSBVc2Uga2VybmVsX3ZfZmxhZ3MgYW5kIGhlbHBlcnMgdG8gdHJhY2sgdmVjdG9yIGNvbnRl
eHQuCiAtIFByZXZlbnQgc29mdGlycSBmcm9tIG5lc3RpbmcgViBjb250ZXh0IGZvciBub24tcHJl
ZW1wdCBWCiAtIEFkZCB1c2VyIGNvcHkgYW5kIG1lbSogcm91dGluZXMKCkNoYW5nZWxvZyB2MzoK
IC0gUmViYXNlIG9uIHRvcCBvZiByaXNjdiBmb3ItbmV4dCAoNi42LXJjMSkKIC0gRml4IGEgYnVp
bGQgaXNzdWUgKENvbm9yKQogLSBHdWFyZCB2c3RhdGVfc2F2ZSwgdnN0YXRlX3Jlc3RvcmUgd2l0
aCB7Z2V0LHB1dH1fY3B1X3ZlY3Rvcl9jb250ZXh0LgogLSBTYXZlIFYgY29udGV4dCBhZnRlciBk
aXNhYmxpbmcgcHJlZW1wdGlvbi4gKEd1bykKIC0gUmVtb3ZlIGlycXNfZGlzYWJsZWQoKSBjaGVj
ayBmcm9tIG1heV91c2Vfc2ltZCgpLiAoQmrDtnJuKQogLSBDb21tZW50IGFib3V0IG5lc3Rpbmcg
ViBjb250ZXh0LgoKQ2hhbmdlbG9nIHYyOgogLSBmaXggYnVpbGQgaXNzdWVzCiAtIEZvbGxvdyBh
cm0ncyB3YXkgb2Ygc3RhcnRpbmcga2VybmVsLW1vZGUgc2ltZCBjb2RlOgogICAtIGFkZCBpbmNs
dWRlL2FzbS9zaW1kLmggYW5kIHJlbmFtZSBtYXlfdXNlX3ZlY3RvcigpIC0+CiAgICAgbWF5X3Vz
ZV9zaW1kKCkKICAgLSByZXR1cm4gdm9pZCBpbiBrZXJuZWxfdmVjdG9yX2JlZ2luKCksIGFuZCBC
VUdfT04gaWYgbWF5X3VzZV9zaW1kKCkKICAgICBmYWlscwogLSBDaGFuZ2UgbmFtaW5nIHNjaGVt
ZSBmb3IgZnVuY3Rpb25zL21hY3JvcyAoQ29ub3IpOgogICAtIHJlbW92ZSBLTVYKICAgLSAncy9y
dnYvdmVjdG9yLycKICAgLSAncy9SSVNDVl9JU0FfVl9QUkVFTVBUSVZFX0tNVi9SSVNDVl9JU0Ff
Vl9QUkVFTVBUSVZFLycKICAgLSAncy9USUZfUklTQ1ZfVl9LTVYvVElGX1JJU0NWX1ZfS0VSTkVM
X01PREUvJwoKQW5keSBDaGl1ICg0KToKICByaXNjdjogdmVjdG9yOiBtYWtlIFZlY3RvciBhbHdh
eXMgYXZhaWxhYmxlIGZvciBzb2Z0aXJxIGNvbnRleHQKICByaXNjdjogc2NoZWQ6IGRlZmVyIHJl
c3RvcmluZyBWZWN0b3IgY29udGV4dCBmb3IgdXNlcgogIHJpc2N2OiBsaWI6IHZlY3Rvcml6ZSBj
b3B5X3RvX3VzZXIvY29weV9mcm9tX3VzZXIKICByaXNjdjogbGliOiBhZGQgdmVjdG9yaXplZCBt
ZW0qIHJvdXRpbmVzCgpHcmVlbnRpbWUgSHUgKDIpOgogIHJpc2N2OiBBZGQgc3VwcG9ydCBmb3Ig
a2VybmVsIG1vZGUgdmVjdG9yCiAgcmlzY3Y6IEFkZCB2ZWN0b3IgZXh0ZW5zaW9uIFhPUiBpbXBs
ZW1lbnRhdGlvbgoKCioqKiBCTFVSQiBIRVJFICoqKgoKQW5keSBDaGl1ICg0KToKICByaXNjdjog
dmVjdG9yOiBtYWtlIFZlY3RvciBhbHdheXMgYXZhaWxhYmxlIGZvciBzb2Z0aXJxIGNvbnRleHQK
ICByaXNjdjogc2NoZWQ6IGRlZmVyIHJlc3RvcmluZyBWZWN0b3IgY29udGV4dCBmb3IgdXNlcgog
IHJpc2N2OiBsaWI6IHZlY3Rvcml6ZSBjb3B5X3RvX3VzZXIvY29weV9mcm9tX3VzZXIKICByaXNj
djogbGliOiBhZGQgdmVjdG9yaXplZCBtZW0qIHJvdXRpbmVzCgpHcmVlbnRpbWUgSHUgKDIpOgog
IHJpc2N2OiBBZGQgc3VwcG9ydCBmb3Iga2VybmVsIG1vZGUgdmVjdG9yCiAgcmlzY3Y6IEFkZCB2
ZWN0b3IgZXh0ZW5zaW9uIFhPUiBpbXBsZW1lbnRhdGlvbgoKIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20vZW50cnktY29tbW9uLmggIHwgIDE3ICsrKysrCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oICAgICB8ICAxNSArKystCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NpbWQuaCAg
ICAgICAgICB8ICA0NiArKysrKysrKysrKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRf
aW5mby5oICAgfCAgIDIgKwogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaCAgICAgICAg
fCAgMzIgKysrKysrKy0KIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20veG9yLmggICAgICAgICAgIHwg
IDgyICsrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgMSArCiBhcmNoL3Jpc2N2L2tlcm5lbC9rZXJuZWxfbW9kZV92ZWN0b3IuYyB8
IDEwMSArKysrKysrKysrKysrKysrKysrKysrKysrCiBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNz
LmMgICAgICAgICAgICB8ICAgNCArLQogYXJjaC9yaXNjdi9rZXJuZWwvcHRyYWNlLmMgICAgICAg
ICAgICAgfCAgIDUgKy0KIGFyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jICAgICAgICAgICAgIHwg
ICA1ICstCiBhcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuYyAgICAgICAgICAgICB8ICAgMiArLQog
YXJjaC9yaXNjdi9saWIvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDYgKysKIGFyY2gvcmlz
Y3YvbGliL21lbWNweV92ZWN0b3IuUyAgICAgICAgIHwgIDI5ICsrKysrKysKIGFyY2gvcmlzY3Yv
bGliL21lbW1vdmVfdmVjdG9yLlMgICAgICAgIHwgIDQ5ICsrKysrKysrKysrKwogYXJjaC9yaXNj
di9saWIvbWVtc2V0X3ZlY3Rvci5TICAgICAgICAgfCAgMzMgKysrKysrKysKIGFyY2gvcmlzY3Yv
bGliL3Jpc2N2X3ZfaGVscGVycy5jICAgICAgIHwgIDU5ICsrKysrKysrKysrKysrKwogYXJjaC9y
aXNjdi9saWIvdWFjY2Vzcy5TICAgICAgICAgICAgICAgfCAgMTEgKysrCiBhcmNoL3Jpc2N2L2xp
Yi91YWNjZXNzX3ZlY3Rvci5TICAgICAgICB8ICA1NSArKysrKysrKysrKysrKwogYXJjaC9yaXNj
di9saWIveG9yLlMgICAgICAgICAgICAgICAgICAgfCAgODEgKysrKysrKysrKysrKysrKysrKysK
IDIwIGZpbGVzIGNoYW5nZWQsIDYyOSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2ltZC5oCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS94b3IuaAogY3JlYXRlIG1vZGUgMTAwNjQ0
IGFyY2gvcmlzY3Yva2VybmVsL2tlcm5lbF9tb2RlX3ZlY3Rvci5jCiBjcmVhdGUgbW9kZSAxMDA2
NDQgYXJjaC9yaXNjdi9saWIvbWVtY3B5X3ZlY3Rvci5TCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9yaXNjdi9saWIvbWVtbW92ZV92ZWN0b3IuUwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlz
Y3YvbGliL21lbXNldF92ZWN0b3IuUwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGli
L3Jpc2N2X3ZfaGVscGVycy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9saWIvdWFj
Y2Vzc192ZWN0b3IuUwogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvbGliL3hvci5TCgot
LSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
