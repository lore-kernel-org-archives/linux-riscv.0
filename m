Return-Path: <SRS0=srnp=MR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF97C4338F
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jul 2021 09:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B59860C51
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jul 2021 09:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B59860C51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0dJ3orCNmV3s1cCFCqOHbsFblyf539dej4bw0vElbiY=; b=qOkCVy97roiG9cWr8oLEwuJZ8o
	m/1zIbXqDyi/o2dzHGHLTsc4B+GC2FpEzHrKcP6hUHFbiMKF5BKTjBfR1r3jwZXh4FIZlLfVnCueR
	MPbosTXUziN6HRks9hq08t21MMxmQvSdbaJpTkofFHfcyq6x4QjSPk6IYYhwzf2PHNTjkz+YgM3pB
	Wusd7SSKILNV4yKYBYAAI3hIYtz78WXcg8cwYeDQqOZpaz6S62j76GZUkntavmfBaXhzAMSCfEgUO
	iZFQ5BjXCc/zCNYKRAystx3j7hdBbEuN2aMenLmr5GP4a5k23edmMNcJpvjfVeuP9Y5B20EHzpwXX
	LCBiOh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7asV-008THk-9D; Sun, 25 Jul 2021 09:56:59 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7asR-008THF-QW
 for linux-riscv@lists.infradead.org; Sun, 25 Jul 2021 09:56:57 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso6971897pjq.2
 for <linux-riscv@lists.infradead.org>; Sun, 25 Jul 2021 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xmv3LwX0AnATg1+COwHT5QSVoeLSDxYJz+oQqylqm1w=;
 b=au+XDlMr89jKEqRhrI/Bv5dIBVdBkX26a+BRaB+hkDIZBVhIypec+SrvNdHyz4o92g
 wl6WFaYTnfY1QfCwhbKP0c/a7q/mKBblbIQiEeYcS16QXNnXWhkWjyzqv22Scudh4/k4
 CixmWT+d4QJ7jNQ8Jm3j2nkMNqIyH7ce9wncotivUwFGLJ/W5oIYLqFEo9B6oHKv4HOR
 Rigp3hvmEFnO4LUNlZpA4D2LuO6k3Ug2LEKFTpO5JbRrH2inRU739RrWEIeGQ/RjLAuQ
 Y1fP8VkooGVmXg6UNFmcmWy5X5FnrOkymGJB22nwQKX+9XO59py+fIyUdBBbPvmcq7eI
 OiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xmv3LwX0AnATg1+COwHT5QSVoeLSDxYJz+oQqylqm1w=;
 b=dJdaPu3p5BO8ObrvxTP40GeuKMlMtAFx7zqHLV9P0WtD5fnaYv5LbDvWqMj94VQ0kG
 aXAYDxrJq42FsYXwTwpMCGJzVg5gB8IVuP489g7icBvyXbAodJbXGRI0zpfUwEdERQnY
 pEjW2ddTVjPrmWxwGnw35/CnH4gC9ZApoewHYqmMBtdh3i0VuUZzBW2R4T/UDY8oHGSZ
 j5WcAUqDnhlSx9K+Dp/Phafwh7uDC+ZABI21tgKvBN66InjkNZu91fawH35eByLHXk9N
 bRsU74MEaaY1GWz3uYHSY0TwavRPky9E+R1Ub47QUdL/BvzXfLefs1j1UGmmHPVr+7G/
 0Q9g==
X-Gm-Message-State: AOAM532ed9IWY2ZBLpD1hIKmzeUJA+q+r0RLkF1VaaKtDviBJq7pgOrK
 FPmuF2zxvXeW6Vl1Dr0a+HfT+KkL1iw=
X-Google-Smtp-Source: ABdhPJwbo7Azg++5hM9A1PLOC9WEdF0D7alxmm+p+J8r3o1NN2NMSczQ5S5/17BqFEWz15t3bhqwLQ==
X-Received: by 2002:a17:90a:b28a:: with SMTP id
 c10mr20637899pjr.59.1627207014186; 
 Sun, 25 Jul 2021 02:56:54 -0700 (PDT)
Received: from [192.168.1.153] (M106072041033.v4.enabler.ne.jp. [106.72.41.33])
 by smtp.gmail.com with ESMTPSA id x14sm14600421pfq.143.2021.07.25.02.56.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 02:56:53 -0700 (PDT)
Subject: Re: Linux 5.14-rc2
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-riscv@lists.infradead.org
References: <mhng-858bf7b5-e294-418d-88c1-1d8ae5ef854e@palmerdabbelt-glaptop>
From: Akira Tsukamoto <akira.tsukamoto@gmail.com>
Message-ID: <bba05067-6f2f-6166-02a0-839f514d3780@gmail.com>
Date: Sun, 25 Jul 2021 18:56:51 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <mhng-858bf7b5-e294-418d-88c1-1d8ae5ef854e@palmerdabbelt-glaptop>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_025655_903900_163179AD 
X-CRM114-Status: GOOD (  14.47  )
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

T24gNy8yNC8yMSAwOTo1OCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+IEkgaGF2ZSBzZW50IHRo
ZSBmaXhlcyB5ZXN0ZXJkYXkgaW4gbXkgdGltZS4KPj4KPj4gaHR0cHM6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIxLUp1bHkvMDA3NjIxLmh0bWwKPj4KPj4g
R3VlbnRlciBhbmQgR2VlcnQgaGF2ZSBjb25maXJtZWQgdGhlIGZpeC4KPj4KPj4gaHR0cHM6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNjdi8yMDIxLUp1bHkvMDA3NjM0
Lmh0bWwKPj4gaHR0cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9saW51eC1yaXNj
di8yMDIxLUp1bHkvMDA3NjI2Lmh0bWwKPj4KPj4gQWtpcmEKPiAKPiBUaGFua3MuwqAgSSd2ZSBn
b3QgdGhlc2Ugb24gZml4ZXMgbm93LCBJJ2xsIHNlbmQgdGhlbSB1cCB0b21vcnJvdyBtb3JuaW5n
IGFzc3VtaW5nIHRoZSBhdXRvYnVpbGRlcnMgZG9uJ3QgZmluZCBhbnkgaXNzdWVzLsKgIExpa2Ug
SSBzYWlkIGluIHRoZSBvdGhlciB0aHJlYWQgSSB3YXNuJ3QgZ2V0dGluZyB0aGVzZSBhbGxtb2Rj
b25maWcgZmFpbHVyZXMsIHNvIGlmIHRoZXJlJ3MgYW4gZWFzeSB3YXkgdG8gcmVwcm9kdWNlIHRo
ZW0gSSdkIGJlIGhhcHB5IHRvIGFkZCBpdCB0byBteSBzZXR1cCAtLSBJIGRvbid0IHJlYWxseSBr
bm93IGFueXRoaW5nIGFib3V0IEdDQyBwbHVnaW5zLCBJJ20ganVzdCB1c2luZyBEZWJpYW4ncyB0
b29sY2hhaW4gZm9yIG15IExpbnV4IHRlc3Qgc2V0dXAgKGhhdmVuJ3QgZ290dGVuIGFyb3VuZCB0
byBtZXJnaW5nIGl0IHdpdGggbXkgR0NDIHRlc3Qgc2V0dXAsIGFuZCBpdCdzIGJlZW4gYSBkZWNh
ZGUgc28gSSBndWVzcyBJIHNob3VsZCBzdG9wIHByZXRlbmRpbmcgdGhhdCdzIGdvaW5nIHRvIGhh
cHBlbiA7KSkuCgpTdXJlLCBteSBwcm9jZWR1cmUgaXMgYmFzZWQgb24gR3VlbnRlcuKAmXMgaW5z
dHJ1Y3Rpb25zLgpJIGJ1aWx0IHFlbXUgdjYuMC4wLCBidWlsZHJvb3QgMjAyMS4wNSBhbmQgdGhl
IGtlcm5lbCB3aXRoIHRoZSB0b29jaGFpbiBjYW1lIHdpdGggYnVpbGRyb290LgoKIyBxZW11Cmdp
dCBjbG9uZSBodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUuZ2l0CmNkIHFlbXUK
Z2l0IGNoZWNrb3V0IC1iIHY2LjAuMApnaXQgc3VibW9kdWxlIHVwZGF0ZSAtLWluaXQgLS1yZWN1
cnNpdmUKZ2l0IHN1Ym1vZHVsZSBzeW5jIC0tcmVjdXJzaXZlCi4vY29uZmlndXJlIC0tdGFyZ2V0
LWxpc3Q9cmlzY3YzMi1zb2Z0bW11ICAtLWRpc2FibGUtdXNlciAtLWRpc2FibGUtZ251dGxzIC0t
ZGlzYWJsZS1kb2NzIC0tZGlzYWJsZS1uZXR0bGUgLS1kaXNhYmxlLWdjcnlwdCAtLWRpc2FibGUt
dm5jLXBuZyAtLWRpc2FibGUteGVuIC0tZGlzYWJsZS14ZW4tcGNpLXBhc3N0aHJvdWdoIC0tZGlz
YWJsZS1saWJzc2gKbWFrZSAtaiAkKG5wcm9jKQoKIyBidWlsZHJvb3QKZ2l0IGNsb25lIGdpdDov
L2dpdC5idWlsZHJvb3QubmV0L2J1aWxkcm9vdApjZCBidWlsZHJvb3QvCmdpdCBjaGVja291dCAy
MDIxLjA1IC1iIDIwMjEuMDUKbWFrZSBxZW11X3Jpc2N2MzJfdmlydF9kZWZjb25maWcKbWFrZQoK
IyBrZXJuZWwKZXhwb3J0IFBBVEg9bG9jYWlvbl9vZl9idWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmlu
OiR7UEFUSH0iCkJ1aWx0IGtlcm5lbC4KCiMgcHJlcGFyZSBib290aW5nIHJ2MzIKRG93bmxvYWRl
ZCByb290ZnMuY3BpbyBhbmQgcnVuLnNoIGZyb20gR3VlbnRlcuKAmXMgbGluayB0byBpbnNpZGUg
YnVpbGRyb290L291dHB1dC9pbWFnZXMvLgpodHRwOi8vc2VydmVyLnJvZWNrLXVzLm5ldC9xZW11
L3Jpc2N2MzIvCgpjZCBvdXRwdXQvaW1hZ2VzClVzZWQgcmV2aXNlZCBydW4uc2guCmBgYApleHBv
cnQgUEFUSD0ibG9jYXRpb25fb2ZfcWVtdS9idWlsZDoke1BBVEh9IgpleHBvcnQgS0VSTkVMX0RJ
Uj1sb2NhdGlvbl9vZl9rZXJuZWwvYXJjaC9yaXNjdi9ib290LwpxZW11LXN5c3RlbS1yaXNjdjMy
IC1NIHZpcnQgLW0gNTEyTSAtbm8tcmVib290IFwKICAgIC1iaW9zIGRlZmF1bHQgLWtlcm5lbCAk
e0tFUk5FTF9ESVJ9SW1hZ2UgXAogICAgLWluaXRyZCByb290ZnMuY3BpbyBcCiAgICAtYXBwZW5k
ICJyZGluaXQ9L3NiaW4vaW5pdCBjb25zb2xlPXR0eVMwLDExNTIwMCBlYXJseWNvbj11YXJ0ODI1
MCxtbWlvLDB4MTAwMDAwMDAsMTE1MjAwIiBcCiAgICAtbm9ncmFwaGljIC1tb25pdG9yIG5vbmUK
YGBgCgpUaGUgcm9vdGZzLmNwaW8gY2hlY2tzIHRoZSBuZXR3b3JrIGFmdGVyIGJvb3RpbmcgYW5k
IHBvd2Vyb2ZmIGltbWVkaWF0ZWx5IHRvIHJldHVybiB0byBzaGVsbC4KCkFraXJhCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
