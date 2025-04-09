Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C743C369A4
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3HegJ2pZwUNnIKTc42K++lMv2mHyK4nWwwdcfaDy2k=; b=MTEnU2FxpmjCaELgvO5NmN9X/W
	xahnhsm7GRTEuwXBH+ub+h5amBZ1KPeVz1p+ObIT1N/QkJ9Haq82PxM2TAq7ob4ZZ0MyWPM6MbQBq
	1RoAUudB8qiSxqGRf4qveBS1vSCv48sTfPpODJ1bJdK87ax++REBqxl5sLU+1gz6hbXB88yGovEw+
	nEPmXdNK1NjoA4oxIZd9kcf9hCXWvcOpuCQC+rD6h2QoN7RcnTKfB1nlnhkVl58gJHLuFQeRZwMUx
	fiLJFlgISwE4Jp4oczuyWvvBZgSfNG+xgVAwy/1ZPSeYjIcUfTr2ofZalturz1hov42z7TgtqD/ag
	Z9j/Ey+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wli-00000007Xsa-0JZb;
	Wed, 09 Apr 2025 14:51:10 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WH7-00000007Qdb-2aiz
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 14:19:35 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227cf12df27so7194895ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 07:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744208372; x=1744813172; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oOgTt3TJCCtZC0mLU59SS0hlKxJUYGJ18JNxrJvKvcQ=;
        b=prQpmxyeoRaoB/5vdl56oInngLMvaO1sB7Vb2zirIZhfNDAsRWCXnTvzWzRxkBqeJu
         xbc53/w3trXuT8EYRzhbnxaX6PtPDKaxx0DgOi+4MqmdcJjy9Y392G9V7AC9hv/hsdQt
         nKUT1uxA9qxoe3Cf+VbaCyG3aGSeFttCjVt7Q/p1GatO485sqem1TCi6BNo1AaV3V50x
         kXubSha3C45Q8bixgkG5s15M8b1ZlbYomKTAZhR44tVpjXZNWXvau+ZPC3074R/3vf9S
         HM9LJGgtPOB1veWQr7pUJ6iDXrPKJMEwVtUupWfHCrSw1oW/ZTZNBo5r4xnbzFF6WzzM
         XtHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208372; x=1744813172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oOgTt3TJCCtZC0mLU59SS0hlKxJUYGJ18JNxrJvKvcQ=;
        b=pkGwtsBMtg6YDjJv1Yk6J+UKejqsMs7gdYIlUM22wL9WTz5kuUA169YGmHEoxfRqv+
         kMLQuB7mgSyxqsW2Fw5ml8sf2xY1G1JQ5pJ7bnTAcz471vS9BJ3HrikPDud1tAoy4UOr
         htXaHH/cnkoGj1vUn0FnHpwSdUqWiEh4jvza7DAjFwMS6f925exW5Kk/KLC5zHJDUlP/
         Cf1CNLGEULBwY2JQkjxnkG3YibstgWmD0MBLLS1JOTLwj2NisvBZqJhpN2uSSE/UYxsy
         P/xQZjEfUsfN6DGgjck/1DBoJkMiRtcj15LMqyEn9iqi63ZM4EABWIB7yv5815nm2+Xy
         F++Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJOiOZiKGLQ9HHTSAsOUgEif7NFrw7UKNknHrgr08AQW8vUgx+l4ua6ey8BFWgGQt7QGpuOltRaeXzFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YywJt+TbVkKBLRIJ6MIGU8WKsZ9fENyqmJ3MOdeVh+AIlZBbAK9
	EUB3fuTCxrXMxjBLCIXcmiyFxsPLczMe9wXR4vPTkE92JKys7XAFtjFWEP2lKSg=
X-Gm-Gg: ASbGncvpZSBNrhGr5DvY550nfrbZ10PJwGJrcRTpg9uY+0TmSG4ijZZBn1mX6Q8BMLe
	uEkNb9T4mcCglkkKLrfB3c+9jLBK/ah9hW6iPHId2a3db9Sw8NJzioBQ3acD0zxHvpETAZ1T00c
	ZGuJQc3ilxY88iyyx9nhX3VMgHt5VfRir5vdyJPCSqvJxZHqrDReHRCvVv6iLsi+3ibcbPmkGNg
	OnSRsjeTVWge88HnptXR3vhQHhPHEJlIyIulVxi3I6aUGfZziO1JLeEN/BQ0bYqjmA+4vRx9w6v
	RPOCccqTMToA2wEiY6z4VpnmjXB08PgjCZVZ8HusJVLh3tm9xxQ=
X-Google-Smtp-Source: AGHT+IEahP8JSiSgxvTh2n1gKbLAyTu8vcSecPJE9+mInATF99BTGal5h90YFsqI5Wz0yhAcDuqM7w==
X-Received: by 2002:a17:902:cec5:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22ac324879cmr39874945ad.7.1744208372199;
        Wed, 09 Apr 2025 07:19:32 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c97a1bsm12321045ad.148.2025.04.09.07.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:19:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 07:19:28 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Zong Li <zong.li@sifive.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com
Subject: Re: [PATCH v12 10/28] riscv/mm: Implement map_shadow_stack() syscall
Message-ID: <Z_aB8EoaqccRz8tn@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-10-e51202b53138@rivosinc.com>
 <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rpHMWvJhWNUKuiMvJZoqN5iTz7USmZYHff=se-+-H+3w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_071933_860549_59E78599 
X-CRM114-Status: GOOD (  30.15  )
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

T24gTW9uLCBBcHIgMDcsIDIwMjUgYXQgMTI6NTA6MzVQTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
Pk9uIFNhdCwgTWFyIDE1LCAyMDI1IGF0IDU6MznigK9BTSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJp
dm9zaW5jLmNvbT4gd3JvdGU6Cj4+Cj4+IEFzIGRpc2N1c3NlZCBleHRlbnNpdmVseSBpbiB0aGUg
Y2hhbmdlbG9nIGZvciB0aGUgYWRkaXRpb24gb2YgdGhpcwo+PiBzeXNjYWxsIG9uIHg4NiAoIng4
Ni9zaHN0azogSW50cm9kdWNlIG1hcF9zaGFkb3dfc3RhY2sgc3lzY2FsbCIpIHRoZQo+PiBleGlz
dGluZyBtbWFwKCkgYW5kIG1hZHZpc2UoKSBzeXNjYWxscyBkbyBub3QgbWFwIGVudGlyZWx5IHdl
bGwgb250byB0aGUKPj4gc2VjdXJpdHkgcmVxdWlyZW1lbnRzIGZvciBzaGFkb3cgc3RhY2sgbWVt
b3J5IHNpbmNlIHRoZXkgbGVhZCB0byB3aW5kb3dzCj4+IHdoZXJlIG1lbW9yeSBpcyBhbGxvY2F0
ZWQgYnV0IG5vdCB5ZXQgcHJvdGVjdGVkIG9yIHN0YWNrcyB3aGljaCBhcmUgbm90Cj4+IHByb3Bl
cmx5IGFuZCBzYWZlbHkgaW5pdGlhbGlzZWQuIEluc3RlYWQgYSBuZXcgc3lzY2FsbCBtYXBfc2hh
ZG93X3N0YWNrKCkKPj4gaGFzIGJlZW4gZGVmaW5lZCB3aGljaCBhbGxvY2F0ZXMgYW5kIGluaXRp
YWxpc2VzIGEgc2hhZG93IHN0YWNrIHBhZ2UuCj4+Cj4+IFRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0
aGlzIHN5c2NhbGwgZm9yIHJpc2N2LiByaXNjdiBkb2Vzbid0IHJlcXVpcmUgdG9rZW4KPj4gdG8g
YmUgc2V0dXAgYnkga2VybmVsIGJlY2F1c2UgdXNlciBtb2RlIGNhbiBkbyB0aGF0IGJ5IGl0c2Vs
Zi4gSG93ZXZlciB0bwo+PiBwcm92aWRlIGNvbXBhdGliaWxpdHkgYW5kIHBvcnRhYmlsaXR5IHdp
dGggb3RoZXIgYXJjaGl0ZWN0dWVzLCB1c2VyIG1vZGUKPj4gY2FuIHNwZWNpZnkgdG9rZW4gc2V0
IGZsYWcuCj4+Cj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+PiAtLS0K
Pj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlICB8ICAgMSArCj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC91c2VyY2ZpLmMgfCAxNDQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTQ1IGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwv
TWFrZWZpbGUKPj4gaW5kZXggOGQxODZiZmNlZDQ1Li4zYTg2MWQzMjA2NTQgMTAwNjQ0Cj4+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVs
L01ha2VmaWxlCj4+IEBAIC0xMjUsMyArMTI1LDQgQEAgb2JqLSQoQ09ORklHX0FDUEkpICAgICAg
ICAgICs9IGFjcGkubwo+PiAgb2JqLSQoQ09ORklHX0FDUElfTlVNQSkgICAgICAgICs9IGFjcGlf
bnVtYS5vCj4+Cj4+ICBvYmotJChDT05GSUdfR0VORVJJQ19DUFVfVlVMTkVSQUJJTElUSUVTKSAr
PSBidWdzLm8KPj4gK29iai0kKENPTkZJR19SSVNDVl9VU0VSX0NGSSkgKz0gdXNlcmNmaS5vCj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC91c2VyY2ZpLmMgYi9hcmNoL3Jpc2N2L2tl
cm5lbC91c2VyY2ZpLmMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi4yNDAyMjgwOWE3YjUKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9hcmNoL3Jpc2N2L2tl
cm5lbC91c2VyY2ZpLmMKPj4gQEAgLTAsMCArMSwxNDQgQEAKPj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDI0IFJpdm9z
LCBJbmMuCj4+ICsgKiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPj4gKyAqLwo+
PiArCj4+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9iaXRv
cHMuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L21t
Lmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbW1hbi5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3VhY2Nl
c3MuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zaXplcy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L3Vz
ZXIuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9zeXNjYWxscy5oPgo+PiArI2luY2x1ZGUgPGxpbnV4
L3ByY3RsLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2Nzci5oPgo+PiArI2luY2x1ZGUgPGFzbS91c2Vy
Y2ZpLmg+Cj4+ICsKPj4gKyNkZWZpbmUgU0hTVEtfRU5UUllfU0laRSBzaXplb2Yodm9pZCAqKQo+
PiArCj4+ICsvKgo+PiArICogV3JpdGVzIG9uIHNoYWRvdyBzdGFjayBjYW4gZWl0aGVyIGJlIGBz
c3B1c2hgIG9yIGBzc2Ftb3N3YXBgLiBgc3NwdXNoYCBjYW4gaGFwcGVuCj4+ICsgKiBpbXBsaWNp
dGx5IG9uIGN1cnJlbnQgc2hhZG93IHN0YWNrIHBvaW50ZWQgdG8gYnkgQ1NSX1NTUC4gYHNzYW1v
c3dhcGAgdGFrZXMgcG9pbnRlciB0bwo+PiArICogc2hhZG93IHN0YWNrLiBUbyBrZWVwIGl0IHNp
bXBsZSwgd2UgcGxhbiB0byB1c2UgYHNzYW1vc3dhcGAgdG8gcGVyZm9ybSB3cml0ZXMgb24gc2hh
ZG93Cj4+ICsgKiBzdGFjay4KPj4gKyAqLwo+PiArc3RhdGljIG5vaW5saW5lIHVuc2lnbmVkIGxv
bmcgYW1vX3VzZXJfc2hzdGsodW5zaWduZWQgbG9uZyAqYWRkciwgdW5zaWduZWQgbG9uZyB2YWwp
Cj4+ICt7Cj4+ICsgICAgICAgLyoKPj4gKyAgICAgICAgKiBOZXZlciBleHBlY3QgLTEgb24gc2hh
ZG93IHN0YWNrLiBFeHBlY3QgcmV0dXJuIGFkZHJlc3NlcyBhbmQgemVybwo+PiArICAgICAgICAq
Lwo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgc3dhcCA9IC0xOwo+PiArCj4+ICsgICAgICAgX19l
bmFibGVfdXNlcl9hY2Nlc3MoKTsKPj4gKyAgICAgICBhc20gZ290bygKPj4gKyAgICAgICAgICAg
ICAgICIub3B0aW9uIHB1c2hcbiIKPj4gKyAgICAgICAgICAgICAgICIub3B0aW9uIGFyY2gsICt6
aWNmaXNzXG4iCj4+ICsgICAgICAgICAgICAgICAiMTogc3NhbW9zd2FwLmQgJVtzd2FwXSwgJVt2
YWxdLCAlW2FkZHJdXG4iCj4KPkhpIERlZXBhaywKPkl0IGp1c3QgY2FtZSB0byBteSBtaW5kLCBk
byB3ZSBuZWVkIHRvIGVuc3VyZSB0aGF0IG1lbnZjZmcuU1NFIGlzIG5vdAo+emVybyBiZWZvcmUg
ZXhlY3V0aW5nIHRoZSBzc2Ftb3N3YXAgaW5zdHJ1Y3Rpb24/IFNpbmNlIHNzYW1vc3dhcCBpcwo+
bm90IGVuY29kZWQgdXNpbmcgTU9QLCBJ4oCZbSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIG1ha2Ug
c3VyZSB0aGF0Cj5leGVjdXRpbmcgc3NhbW9zd2FwIHdvbuKAmXQgYWNjaWRlbnRhbGx5IHRyaWdn
ZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbgo+ZXhjZXB0aW9uLiBUaGFua3MuCgpGV0ZUIHBhdGNo
ZXMgdHVybiBTU0UgZHVyaW5nIGVhcmx5IGJvb3QuIFRoZXJlIGlzIGEgYnVnIHRoZXJlIHRob3Vn
aCwKSSBuZWVkIHRvIGNoZWNrIGlmIHRob3NlIEZXRlQgU0JJIGNhbGwgc3VjY2VlZGVkIG9yIG5v
dC4gSWYgaXQgZmFpbGVkCnRoZW4gaXRzaG91bGQgc2V0IGEgZ2xvYmFsIHZhcmlhYmxlIGluZGlj
YXRpbmcgc2hhZG93IHN0YWNrIGNhbid0IGJlCnR1cm5lZCBvbi4gQW5kIGluIHRoYXQgY2FzZSB0
aGlzIGZsb3cgd291bGRuJ3QgYmUgcmVhY2hhYmxlLiBTb29uIEkKd2lsbCBwb3N0IHYxMyB3aXRo
IHRoZXNlIGNoYW5nZXMuCgpUaGFua3MgZm9yIG5vdGljaW5nLgo+Cj4+ICsgICAgICAgICAgICAg
ICBfQVNNX0VYVEFCTEUoMWIsICVsW2ZhdWx0XSkKPj4gKyAgICAgICAgICAgICAgIFJJU0NWX0FD
UVVJUkVfQkFSUklFUgo+PiArICAgICAgICAgICAgICAgIi5vcHRpb24gcG9wXG4iCj4+ICsgICAg
ICAgICAgICAgICA6IFtzd2FwXSAiPXIiIChzd2FwKSwgW2FkZHJdICIrQSIgKCphZGRyKQo+PiAr
ICAgICAgICAgICAgICAgOiBbdmFsXSAiciIgKHZhbCkKPj4gKyAgICAgICAgICAgICAgIDogIm1l
bW9yeSIKPj4gKyAgICAgICAgICAgICAgIDogZmF1bHQKPj4gKyAgICAgICAgICAgICAgICk7Cj4+
ICsgICAgICAgX19kaXNhYmxlX3VzZXJfYWNjZXNzKCk7Cj4+ICsgICAgICAgcmV0dXJuIHN3YXA7
Cj4+ICtmYXVsdDoKPj4gKyAgICAgICBfX2Rpc2FibGVfdXNlcl9hY2Nlc3MoKTsKPj4gKyAgICAg
ICByZXR1cm4gLTE7Cj4+ICt9Cj4+ICsKPj4gKy8qCj4+ICsgKiBDcmVhdGUgYSByZXN0b3JlIHRv
a2VuIG9uIHRoZSBzaGFkb3cgc3RhY2suICBBIHRva2VuIGlzIGFsd2F5cyBYTEVOIHdpZGUKPj4g
KyAqIGFuZCBhbGlnbmVkIHRvIFhMRU4uCj4+ICsgKi8KPj4gK3N0YXRpYyBpbnQgY3JlYXRlX3Jz
dG9yX3Rva2VuKHVuc2lnbmVkIGxvbmcgc3NwLCB1bnNpZ25lZCBsb25nICp0b2tlbl9hZGRyKQo+
PiArewo+PiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcjsKPj4gKwo+PiArICAgICAgIC8qIFRv
a2VuIG11c3QgYmUgYWxpZ25lZCAqLwo+PiArICAgICAgIGlmICghSVNfQUxJR05FRChzc3AsIFNI
U1RLX0VOVFJZX1NJWkUpKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICsK
Pj4gKyAgICAgICAvKiBPbiBSSVNDLVYgd2UncmUgY29uc3RydWN0aW5nIHRva2VuIHRvIGJlIGZ1
bmN0aW9uIG9mIGFkZHJlc3MgaXRzZWxmICovCj4+ICsgICAgICAgYWRkciA9IHNzcCAtIFNIU1RL
X0VOVFJZX1NJWkU7Cj4+ICsKPj4gKyAgICAgICBpZiAoYW1vX3VzZXJfc2hzdGsoKHVuc2lnbmVk
IGxvbmcgX191c2VyICopYWRkciwgKHVuc2lnbmVkIGxvbmcpc3NwKSA9PSAtMSkKPj4gKyAgICAg
ICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+PiArCj4+ICsgICAgICAgaWYgKHRva2VuX2FkZHIp
Cj4+ICsgICAgICAgICAgICAgICAqdG9rZW5fYWRkciA9IGFkZHI7Cj4+ICsKPj4gKyAgICAgICBy
ZXR1cm4gMDsKPj4gK30KPj4gKwo+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgYWxsb2NhdGVfc2hh
ZG93X3N0YWNrKHVuc2lnbmVkIGxvbmcgYWRkciwgdW5zaWduZWQgbG9uZyBzaXplLAo+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB0b2tl
bl9vZmZzZXQsIGJvb2wgc2V0X3RvaykKPj4gK3sKPj4gKyAgICAgICBpbnQgZmxhZ3MgPSBNQVBf
QU5PTllNT1VTIHwgTUFQX1BSSVZBVEU7Cj4+ICsgICAgICAgc3RydWN0IG1tX3N0cnVjdCAqbW0g
PSBjdXJyZW50LT5tbTsKPj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHBvcHVsYXRlLCB0b2tfbG9j
ID0gMDsKPj4gKwo+PiArICAgICAgIGlmIChhZGRyKQo+PiArICAgICAgICAgICAgICAgZmxhZ3Mg
fD0gTUFQX0ZJWEVEX05PUkVQTEFDRTsKPj4gKwo+PiArICAgICAgIG1tYXBfd3JpdGVfbG9jayht
bSk7Cj4+ICsgICAgICAgYWRkciA9IGRvX21tYXAoTlVMTCwgYWRkciwgc2l6ZSwgUFJPVF9SRUFE
LCBmbGFncywKPj4gKyAgICAgICAgICAgICAgICAgICAgICBWTV9TSEFET1dfU1RBQ0sgfCBWTV9X
UklURSwgMCwgJnBvcHVsYXRlLCBOVUxMKTsKPj4gKyAgICAgICBtbWFwX3dyaXRlX3VubG9jayht
bSk7Cj4+ICsKPj4gKyAgICAgICBpZiAoIXNldF90b2sgfHwgSVNfRVJSX1ZBTFVFKGFkZHIpKQo+
PiArICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4+ICsKPj4gKyAgICAgICBpZiAoY3JlYXRlX3Jz
dG9yX3Rva2VuKGFkZHIgKyB0b2tlbl9vZmZzZXQsICZ0b2tfbG9jKSkgewo+PiArICAgICAgICAg
ICAgICAgdm1fbXVubWFwKGFkZHIsIHNpemUpOwo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Cj4+ICsgICAgICAgfQo+PiArCj4+ICsgICAgICAgYWRkciA9IHRva19sb2M7Cj4+ICsK
Pj4gK291dDoKPj4gKyAgICAgICByZXR1cm4gYWRkcjsKPj4gK30KPj4gKwo+PiArU1lTQ0FMTF9E
RUZJTkUzKG1hcF9zaGFkb3dfc3RhY2ssIHVuc2lnbmVkIGxvbmcsIGFkZHIsIHVuc2lnbmVkIGxv
bmcsIHNpemUsIHVuc2lnbmVkIGludCwgZmxhZ3MpCj4+ICt7Cj4+ICsgICAgICAgYm9vbCBzZXRf
dG9rID0gZmxhZ3MgJiBTSEFET1dfU1RBQ0tfU0VUX1RPS0VOOwo+PiArICAgICAgIHVuc2lnbmVk
IGxvbmcgYWxpZ25lZF9zaXplID0gMDsKPj4gKwo+PiArICAgICAgIGlmICghY3B1X3N1cHBvcnRz
X3NoYWRvd19zdGFjaygpKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+
PiArCj4+ICsgICAgICAgLyogQW55dGhpbmcgb3RoZXIgdGhhbiBzZXQgdG9rZW4gc2hvdWxkIHJl
c3VsdCBpbiBpbnZhbGlkIHBhcmFtICovCj4+ICsgICAgICAgaWYgKGZsYWdzICYgflNIQURPV19T
VEFDS19TRVRfVE9LRU4pCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKwo+
PiArICAgICAgIC8qCj4+ICsgICAgICAgICogVW5saWtlIG90aGVyIGFyY2hpdGVjdHVyZXMsIG9u
IFJJU0MtViwgU1NQIHBvaW50ZXIgaXMgaGVsZCBpbiBDU1JfU1NQIGFuZCBpcyBhdmFpbGFibGUK
Pj4gKyAgICAgICAgKiBDU1IgaW4gYWxsIG1vZGVzLiBDU1IgYWNjZXNzZXMgYXJlIHBlcmZvcm1l
ZCB1c2luZyAxMmJpdCBpbmRleCBwcm9ncmFtbWVkIGluIGluc3RydWN0aW9uCj4+ICsgICAgICAg
ICogaXRzZWxmLiBUaGlzIHByb3ZpZGVzIHN0YXRpYyBwcm9wZXJ0eSBvbiByZWdpc3RlciBwcm9n
cmFtbWluZyBhbmQgd3JpdGVzIHRvIENTUiBjYW4ndAo+PiArICAgICAgICAqIGJlIHVuaW50ZW50
aW9uYWwgZnJvbSBwcm9ncmFtbWVyJ3MgcGVyc3BlY3RpdmUuIEFzIGxvbmcgYXMgcHJvZ3JhbW1l
ciBoYXMgZ3VhcmRlZCBhcmVhcwo+PiArICAgICAgICAqIHdoaWNoIHBlcmZvcm0gd3JpdGVzIHRv
IENTUl9TU1AgcHJvcGVybHksIHNoYWRvdyBzdGFjayBwaXZvdGluZyBpcyBub3QgcG9zc2libGUu
IFNpbmNlCj4+ICsgICAgICAgICogQ1NSX1NTUCBpcyB3cml0ZWFibGUgYnkgdXNlciBtb2RlLCBp
dCBpdHNlbGYgY2FuIHNldHVwIGEgc2hhZG93IHN0YWNrIHRva2VuIHN1YnNlcXVlbnQKPj4gKyAg
ICAgICAgKiB0byBhbGxvY2F0aW9uLiBBbHRob3VnaCBpbiBvcmRlciB0byBwcm92aWRlIHBvcnRh
YmxpdHkgd2l0aCBvdGhlciBhcmNoaXRlY3R1cmUgKGJlY2F1c2UKPj4gKyAgICAgICAgKiBgbWFw
X3NoYWRvd19zdGFja2AgaXMgYXJjaCBhZ25vc3RpYyBzeXNjYWxsKSwgUklTQy1WIHdpbGwgZm9s
bG93IGV4cGVjdGF0aW9uIG9mIGEgdG9rZW4KPj4gKyAgICAgICAgKiBmbGFnIGluIGZsYWdzIGFu
ZCBpZiBwcm92aWRlZCBpbiBmbGFncywgc2V0dXAgYSB0b2tlbiBhdCB0aGUgYmFzZS4KPj4gKyAg
ICAgICAgKi8KPj4gKwo+PiArICAgICAgIC8qIElmIHRoZXJlIGlzbid0IHNwYWNlIGZvciBhIHRv
a2VuICovCj4+ICsgICAgICAgaWYgKHNldF90b2sgJiYgc2l6ZSA8IFNIU1RLX0VOVFJZX1NJWkUp
Cj4+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT1NQQzsKPj4gKwo+PiArICAgICAgIGlmIChh
ZGRyICYmIChhZGRyICYgKFBBR0VfU0laRSAtIDEpKSkKPj4gKyAgICAgICAgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+PiArCj4+ICsgICAgICAgYWxpZ25lZF9zaXplID0gUEFHRV9BTElHTihzaXpl
KTsKPj4gKyAgICAgICBpZiAoYWxpZ25lZF9zaXplIDwgc2l6ZSkKPj4gKyAgICAgICAgICAgICAg
IHJldHVybiAtRU9WRVJGTE9XOwo+PiArCj4+ICsgICAgICAgcmV0dXJuIGFsbG9jYXRlX3NoYWRv
d19zdGFjayhhZGRyLCBhbGlnbmVkX3NpemUsIHNpemUsIHNldF90b2spOwo+PiArfQo+Pgo+PiAt
LQo+PiAyLjM0LjEKPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
