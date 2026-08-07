Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 865C2C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GquKtTUpsFZHA9KscImn02Y7z1z7Bf/Eo6rLHDY3MZk=; b=AF3G3T9CWAPEnn
	5NirtvDUWv7PgPzl5m68tm471AJRdb/0+6RNDtC2eKSlbMUwQ7DHZ3kRQbwgFcuOCjdgBLCAaPe53
	KmRbIQvtemJ25ut04dp3YJayWLudMyD+H8SWQ75XoGkqCU+52zrMYXzAeZHF4WsXULKDJqRAvQkqZ
	3e2WH6GrBgQVNW9NplmXFy7MlLZ/9mNR3ysc6wvHGTvecLC7RSB5GBgKHJ/wqy/yAEq0Dpz+imWtB
	M1x/1n05Fuq0cZTZ8W21dGVeKJVCA8ctlMKm3QYUSITY1F9hspe4nECLJJ6/VvNCfmXocnCIq3toQ
	qgdC13S0lJmHCMfbg7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNca-00000008RVW-1SIj;
	Fri, 07 Aug 2026 16:40:36 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcY-00000008RUN-2C89
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:35 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1893911f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120833; cv=none;
        d=google.com; s=arc-20260327;
        b=FSywT9TYXeC355GZuIuVwO+julX8eysWTQRDtJQ1GsPk8IvWW5B7OGrcuWTzNKPGST
         XfbbXxJEvNVTx0IL88Y4WEHsj94TcB2EBa+N7R+9emqDIgu8WB52/WQ+7hxnniNUdaeA
         evWAiD35AgaeGnA8a9wr5mns4G7LCb228lzFq51lNvPTDLtexzHiHPLT6KGtohkdGxz9
         up9TimgI3pAQEK61f6fI5AvS62iA3TbuFWMeAQOaqsWoAJj1Y7Up6O2w++r1LApP0kky
         taDRyMosRMBHCgdXTwZJOXJXzYQKVm4TLyDiJSsOal4lj209KA+7pWgrZAw1eYGmhtDu
         CMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        fh=TZHTTW2AxsLfFEz35o0xwrpzmvPAAKBSQP2yolu14mE=;
        b=gBC+Bb06f6Rg/zBGku4yU9fFnUxf5zhjcxZ73jaWqyt59VGohjS8tXb7tDpqReaKb7
         pSIOqRxnOZx51fm0YjFjArcJ91Ika0/iTTOIUhefvY1IIIEvru5CfVl01EWj9+40NUSy
         7Pf9oaqSih9P5TRtAomfI1Ujih6+MdFzhYxOvbDgl9BGcpaqwEct909H3adrBILj+BDK
         xafv9CUCqGddMZqOtlchyNxyGmBpb5n79VbJAZxSbu+6wHeLU9jrt+aetvRVwGvQRGEw
         YMcsuD3T7uF+FO2WnutDR9+3auGvVrt7IPLsYKy7kSAa1BlBwPZZNhxQKCeT+q2xqgiz
         Y/QA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120832; x=1786725632; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        b=aK85/PQT3eHcSXe6JGMZ/90LytbE5YARbJsgXQsiNQuf7h+J6TRFU1LD+Qbce+AL8Y
         ArH46BNhYp1MN/YXeSvEXAP6k6IHybfaEhyPUHDAP8qrWjTx1Cf+yySCoVzOHoz/hz/3
         H4AmrIzMlCJHAk/PmF5r7wN6m4ghnR+K0KKvW1LoyFEmsuHwPmFIjHIVi5LSq4a4bdE9
         TInrsFMUrmr08uHSPHpkfq4nRDcyWFm7HvtETtX6FCdOtaeFs5i49B0OW21q11oVBm7X
         iUjlKLqah5Y9vIZpd7OXxsuNFkdb43zBqnMSDslfqD7EBwvR07WTAKeLYjDpqIfRNEHN
         aTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120832; x=1786725632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        b=Anppd6d1pChxjHV+K+a0byCDHxAAjTbnYwdgeHV1+3NLMH9I5yuYUCnWbw+lybqlyM
         djzAMKO5Jb1SOzJqm3lY4iYky8ySxvCEt906x9CzwSI2Yi/QoMF7k770LbydbQOjXKNR
         F4VF+S4GhQnTTum390RtBOIZwzltIg+/DCnItbIrwA8RaSCaBkNEXHSUnZwhmW+wZ+V6
         PD3dHyGmCofu0KLUaLB2a1sCuAVTOWYEJ29DdAXC2PXIo8yMX70jZtQfICkQ/lYBHr5U
         CokB9PzU6LwiFokxQRV1QAZkdiq2QZwWZkQZab5tCkw13o6lsYbXdEvV3DGM3tEcFyly
         P6cg==
X-Forwarded-Encrypted: i=1; AHgh+RrwkDn/GVkuVMhvOKWePWnzpKj5yBqOv6UvHRxQj/5jfLBGxWXFylwDchSwBVrfdvPIFgOq5xJVs/h6Yw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxauNmsiKSs9VoHTNC/91VNHYRrFN9icaG39hqM+D4wGouN1NLA
	MlxMWvNKvkEeSIaf/fXrarhA6x50EEvaviSM0AzMmnf8WXfcgzhY6NTYUAj1fv75dUSUz+ikEtt
	DUN6zv7JzT0LcS5W6ZU+gbXXbjdSSD2gLz3l5ZGv6mw==
X-Gm-Gg: AR+sD12TiG1udWlqaU7w4DOA5D38zrWcGIah5KmkXbVV/hPuoVSpPy9MXo4xK8uiJrS
	l7Jz4LCdTC5U0ZeFhDQR6yPlNLUhFwuwnhev4FUkBb6QiySOhSwEKx7wZkhsNXmrhrsbRfdnTnw
	J1yfmZqj+rVPtH5qgi32V7IR7J3+TZD3/g/ioa8K4AZnaV8LPfwZIK6A9vwBwSbRVagywXenQ5Q
	EQeo1jbz5HCIjNaYAdf9a7ywYUUeYXCPl1kJZ156dNM+EYrbioF60i5VA8JamHQozKeYfr+yj0H
	soHGy/uZBL06xgi3gH3Okf+OyI3ASdGDW+VKcwTGKMM+Uo+aZIvDJPj3r3nAIta7tMOII7IaBg/
	EeYQPogQWHLU8G67ffzCNJ/4FRQfW3i9dH6TBt+xckP3DslMmtFkPQGI6oqtY05fI
X-Received: by 2002:adf:ec0e:0:b0:47f:4dfc:ca1e with SMTP id
 ffacd0b85a97d-48130e7e846mr1247509f8f.5.1786120832608; Fri, 07 Aug 2026
 09:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260718033646.002.31dc89f2-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718033646.002.31dc89f2-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:20 +0530
X-Gm-Features: AUfX_mxaKOttqZ90LkDJu3zXy0Nxt0iXONOyY8DEizW4DWkuOLmRJN7Yk8VckPQ
Message-ID: <CAAhSdy1pw+g84HFq9okYcfmG9_nV=Te8q0YHt5yNtf6zsYP9sQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow memslots ending at the GPA limit
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, Yifei Jiang <jiangyifei@huawei.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094034_615424_4B118994 
X-CRM114-Status: GOOD (  14.87  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgOToyMuKAr0FNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gS1ZNIG1lbXNsb3RzIGRlc2NyaWJlIGhhbGYtb3BlbiBy
YW5nZXMgW2Jhc2VfZ2ZuLCBiYXNlX2dmbiArIG5wYWdlcykuIEEKPiBzbG90IGVuZGluZyBleGFj
dGx5IGF0IHRoZSBndWVzdCBwaHlzaWNhbC1hZGRyZXNzIGxpbWl0IGhhcyBpdHMgZmluYWwgcGFn
ZQo+IGJlbG93IHRoYXQgbGltaXQgYW5kIGlzIHZhbGlkLgo+Cj4gVGhlIGN1cnJlbnQgZ3JlYXRl
ci10aGFuLW9yLWVxdWFsIGNvbXBhcmlzb24gcmVqZWN0cyBhIHZhbGlkIGJvdW5kYXJ5IGNhc2Uu
Cj4gVXNlIGEgc3RyaWN0IGdyZWF0ZXItdGhhbiBjb21wYXJpc29uLCBtYXRjaGluZyBlcXVpdmFs
ZW50IEtWTSBhcmNoaXRlY3R1cmUKPiBjaGVja3MuCj4KPiBGaXhlczogOWQwNWMxZmVlODM3ICgi
UklTQy1WOiBLVk06IEltcGxlbWVudCBzdGFnZTIgcGFnZSB0YWJsZSBwcm9ncmFtbWluZyIpCj4g
U2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0
aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL21tdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gv
cmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMDgyZjliMjYxNzMzOC4uZDNjMGM2OTlhZGI2MCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21t
dS5jCj4gQEAgLTE4NCw3ICsxODQsNyBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVn
aW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAqIFByZXZlbnQgdXNlcnNwYWNlIGZyb20g
Y3JlYXRpbmcgYSBtZW1vcnkgcmVnaW9uIG91dHNpZGUgb2YgdGhlIEdQQQo+ICAgICAgICAgICog
c3BhY2UgYWRkcmVzc2FibGUgYnkgdGhlIEtWTSBndWVzdCBHUEEgc3BhY2UuCj4gICAgICAgICAg
Ki8KPiAtICAgICAgIGlmICgobmV3LT5iYXNlX2dmbiArIG5ldy0+bnBhZ2VzKSA+PQo+ICsgICAg
ICAgaWYgKChuZXctPmJhc2VfZ2ZuICsgbmV3LT5ucGFnZXMpID4KPiAgICAgICAgICAgICAga3Zt
X3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZShrdm0tPmFyY2gucGdkX2xldmVscykgPj4gUEFHRV9TSElG
VCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4KPiAtLQo+IDIuNDMuMAo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
