Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBACDC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 11:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pe+pyfnA52/xMWbxRQHACXe+XTyw1ovFDPCE3LdA1uI=; b=cnO7axRhi8bYWs
	6DurTYelYXk6SsmgPtqIoymaD5EFR0QVtYFd1PZz30nWYZTfEmT0SJC27IgUdFgzDEYwExqPZsHi2
	OJQ4tK6Q5BJ/tdC7IQgqbN7BH/0DCy1mujfnjjjuvgjqhaiDXDXX21MLVsC0ye97kSxVxqhylYxv0
	Bz9XsQZ6ySb4LIavcnnPdz0fbF2mHt6TJr8zbC9JMYMLrbNRsV61P0fyDEb5DOWSVn4LCfZ+LSb/4
	ihOlfUK0EDiUQW8Wal78SHJB29gZs+tuQjnWdVlf2iKW4ZVCT5Z4TfDWa8xvyzFDAKeywFqLNIUow
	zX1jzpfBUBv5prvboxLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWbEh-009JB9-Nc; Mon, 27 Feb 2023 11:00:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWbEd-009J9W-S0
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 11:00:01 +0000
Received: by mail-pj1-x1032.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so9669345pjb.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 02:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MFzgTaiWcQIPYwKIkE4QWiTWeDFQMo1N82kLFrXukaQ=;
        b=OPz8eYyLQJ7KhWOumITy9lQam4wFZij+pd7qvjPRO+RxtIh9HEUGdDZE5OxqgA7HXO
         bcsmA7e5S3+wfI9B6l0CN84Hf2RCO/hZmJDy78pnD5mnO8cxm+fajkPJYBn+vVWX061n
         6pjkdJXWM5TT4puVefhwCfIl7AfbCx1FikV2Kd+URNaUzsYA9lmxND+C5/6BkhfH4Ev/
         TIUXYJTHVsysuwfINf8W9T9bztowbQpfOX1oLHiy3THDb2lu76oIVc0KWhjMzA1x9r34
         eaKUgPIzXhXl5vln6YmYkEWXl006nArQqQWJ86hT16OAeFDgsw6Z4Ab6JLjB5M5ISQUJ
         0D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFzgTaiWcQIPYwKIkE4QWiTWeDFQMo1N82kLFrXukaQ=;
        b=5Vs9mbpM0i/MDfzX6jmbS6Jq5AVY/VpWnX0aQT9o42lk8Bu0ULnt1sEIoOt5e1q0ty
         xK+UwPQM/oHzaF9HJo+/6iyU9r+K5EMTgUiggpa9N9IWX5aQ/9alhbMWuLFKt3KI/XRw
         Jpl/tk9TE4o7oD8M8A2joBwYBaV60UlznfEN9NbLUAOGjnpTDYgSA50gI8ph8iTl1tVO
         pgu7E6jcm0y0iBuDotSMmUEIcNj/v/CUQ8RGkS6ONMCS1p+I1FTXeVi9q3AWbvSFNcLA
         LJ8Prdms4bnDo9kinDIfdKO2CR9eJxs+KNgB72FjW5IW3wLMiZrGPQIYbO4Sui1jGk3R
         znjQ==
X-Gm-Message-State: AO0yUKWT+PJ5fybWupDzqOP5B1rPUrOLbpsK5erx/4ajRwJyqwMuXAbE
	eTRe/DVxPk4C+Zepe13Iy/YXKp9vJuo=
X-Google-Smtp-Source: AK7set9tHTkqdUjni8Yoqj+dQFR6RfCuA7YAg7Vi/pbwgMFz4YIas8EaUb6bFHEgmK4tjS6iem3Jdg==
X-Received: by 2002:a17:902:d2c8:b0:19d:19fb:55fd with SMTP id n8-20020a170902d2c800b0019d19fb55fdmr2924513plc.20.1677495596942;
        Mon, 27 Feb 2023 02:59:56 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902b68500b0019a7385079esm4292115pls.123.2023.02.27.02.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:59:56 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	siyanteng@loongson.cn,
	robh@kernel.org,
	conor.dooley@microchip.com,
	palmer@rivosinc.com,
	leyfoon.tan@starfivetech.com
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH] sched/doc: supplement CPU capacity with RISC-V
Date: Mon, 27 Feb 2023 18:59:41 +0800
Message-Id: <20230227105941.2749193-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_025959_987709_ACB48090 
X-CRM114-Status: GOOD (  10.25  )
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

VGhpcyBjb21taXQgN2QyMDc4MzEwY2JmICgiZHQtYmluZGluZ3M6IGFybTogbW92ZSBjcHUtY2Fw
YWNpdHkgdG8gYQpzaGFyZWQgbG9hdGlvbiIpIHVwZGF0ZXMgc29tZSByZWZlcmVuY2VzIGFib3V0
IGNhcGFjaXR5LWRtaXBzLW1oegpwcm9wZXJ0eSBpbiB0aGlzIGRvY3VtZW50LgoKVGhlIGxpc3Qg
b2YgYXJjaGl0ZWN0dXJlcyB1c2luZyBjYXBhY2l0eS1kbWlwcy1taHogb21pdHMgUklTQy1WLCBz
bwpzdXBwbGVtZW50cyBpdCBoZXJlLgoKU2lnbmVkLW9mZi1ieTogU29uZyBTaHVhaSA8c3VhZ3Jm
aWxsZXRAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vc2NoZWR1bGVyL3NjaGVkLWNhcGFj
aXR5LnJzdCAgICAgICAgICAgICAgICAgICAgfCAyICstCiBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0IHwgMiArLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0IGIvRG9jdW1lbnRhdGlvbi9z
Y2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0CmluZGV4IDhlMmI4NTM4YmMyYi4uZTJjMWNmNzQz
MTU4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3NjaGVkdWxlci9zY2hlZC1jYXBhY2l0eS5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9zY2hlZHVsZXIvc2NoZWQtY2FwYWNpdHkucnN0CkBAIC0y
NTgsNyArMjU4LDcgQEAgTGludXggY2Fubm90IGN1cnJlbnRseSBmaWd1cmUgb3V0IENQVSBjYXBh
Y2l0eSBvbiBpdHMgb3duLCB0aGlzIGluZm9ybWF0aW9uIHRodXMKIG5lZWRzIHRvIGJlIGhhbmRl
ZCB0byBpdC4gQXJjaGl0ZWN0dXJlcyBtdXN0IGRlZmluZSBhcmNoX3NjYWxlX2NwdV9jYXBhY2l0
eSgpCiBmb3IgdGhhdCBwdXJwb3NlLgogCi1UaGUgYXJtIGFuZCBhcm02NCBhcmNoaXRlY3R1cmVz
IGRpcmVjdGx5IG1hcCB0aGlzIHRvIHRoZSBhcmNoX3RvcG9sb2d5IGRyaXZlcgorVGhlIGFybSwg
YXJtNjQsIGFuZCBSSVNDLVYgYXJjaGl0ZWN0dXJlcyBkaXJlY3RseSBtYXAgdGhpcyB0byB0aGUg
YXJjaF90b3BvbG9neSBkcml2ZXIKIENQVSBzY2FsaW5nIGRhdGEsIHdoaWNoIGlzIGRlcml2ZWQg
ZnJvbSB0aGUgY2FwYWNpdHktZG1pcHMtbWh6IENQVSBiaW5kaW5nOyBzZWUKIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9jcHUvY3B1LWNhcGFjaXR5LnR4dC4KIApkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVyL3NjaGVkLWNhcGFj
aXR5LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hl
ZC1jYXBhY2l0eS5yc3QKaW5kZXggZTA3ZmZkZDM5MWQzLi44Y2JhMTM1ZGNkMWEgMTAwNjQ0Ci0t
LSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3NjaGVkdWxlci9zY2hlZC1jYXBh
Y2l0eS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vc2NoZWR1bGVy
L3NjaGVkLWNhcGFjaXR5LnJzdApAQCAtMjMxLDcgKzIzMSw3IEBAIENGU+iwg+W6puexu+WfuuS6
juWunuS9k+i0n+i9vei3n+i4quacuuWItu+8iFBlci1FbnRpdHkgTG9hZCBUcmFja2luZywgUEVM
VO+8iQog5b2T5YmN77yMTGludXjml6Dms5Xlh63oh6rouqvnrpflh7pDUFXnrpflipvvvIzlm6Dm
raTlv4XpobvopoHmnInmiorov5nkuKrkv6Hmga/kvKDpgJLnu5lMaW51eOeahOaWueW8j+OAguav
j+S4quaetuaehOW/hemhu+S4uuatpAog5a6a5LmJYXJjaF9zY2FsZV9jcHVfY2FwYWNpdHkoKeWH
veaVsOOAggogCi1hcm3lkoxhcm02NOaetuaehOebtOaOpeaKiui/meS4quS/oeaBr+aYoOWwhOWI
sGFyY2hfdG9wb2xvZ3npqbHliqjnmoRDUFUgc2NhbGluZ+aVsOaNruS4re+8iOivkeazqO+8muWP
guiAgworYXJt44CBYXJtNjTlkoxSSVNDLVbmnrbmnoTnm7TmjqXmiorov5nkuKrkv6Hmga/mmKDl
sITliLBhcmNoX3RvcG9sb2d56amx5Yqo55qEQ1BVIHNjYWxpbmfmlbDmja7kuK3vvIjor5Hms6jv
vJrlj4LogIMKIGFyY2hfdG9wb2xvZ3kuaOeahHBlcmNwdeWPmOmHj2NwdV9zY2FsZe+8ie+8jOWu
g+aYr+S7jmNhcGFjaXR5LWRtaXBzLW1oeiBDUFUgYmluZGluZ+S4reihjeeUn+iuoeeulwog5Ye6
5p2l55qE44CC5Y+C6KeBRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2NwdS9jcHUt
Y2FwYWNpdHkudHh044CCCiAKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
