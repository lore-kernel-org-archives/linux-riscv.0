Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04391C46467
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 02:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VOJ/SQl3PcSKeSD5HZ5l2TrDFtQ9jnuPBWMyQXSQmPk=; b=3tk0DWxw5D+xny
	jvYxu5naDAAx5DrAM6oNDdWy5JyT2m+i2ysaf/fF6K3om3TddLQr+jYzp7LICv67OlUwN331zIgoY
	sCkoJ24wTO+pSswUDeYdJL7Rj9lZuXFXk8c3GFjX60tCLskgx7fciGiDETqtfNAbwKzKKLDd56ibG
	7WBBn4z1sCi1eI1SNTN4bAqBKbVZO60sIuR2ZcVyiFOmoau2665GTNDCIQH2csq8esLf7sgWDDV3+
	jmeM2XIBJ1C6ZYtSrIFE92QD+qMCqmeI1Z8GzqBp+YtJZ4j2rxmB5RvfPAVoQWgsq7oMGO85eL4FV
	y39c/SY/jAm8GVqBPkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDFos-00GXsr-VY; Thu, 05 Jan 2023 02:17:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDCTV-00Cod1-7t
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 22:43:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id z7so18295447pfq.13
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jan 2023 14:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CH/GksoyQ7eGY7DkX8kZfT0W+/XE2gY76x4ssyQdIVU=;
        b=O1FuQeF0/OMopxUP425sEjF8ble0mj9nrnNey0bg3Bqb598B/ViCHrKAuGDqoLPqLi
         uVp5UYEMQ3phzW9RZujzcom+ZUORqTK1CDsSn1DeOexWYckP6JG/Km0QoGHir1lA3UKV
         iqR61FGZcIppiheckRFXdpHP8Vb3svS0nUZehOEWC45PYUDhADv/0+Es/uJnkJVwnP6W
         zgDWB/tjImbV1sPtwQaDouHbP3dIWPFLWYjaEmE+mejTa/RJP2qAo8Ukg7sK+pQId8Z5
         4Wq69TpXISInKfNWcyEjBjiG6X4ZmbZ7WZbOdHWxqlpUocRuExdWLkpvggkuNOlj9v3C
         blRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CH/GksoyQ7eGY7DkX8kZfT0W+/XE2gY76x4ssyQdIVU=;
        b=qccVQxoYqBkys6/lt72v0xYyoukDq5s3MmqKbh4YlH5OMVaneTUCA4hSiq2kEeWHcC
         VA1diBUA49//hkDJ+dfolY6ee7NeWnwDCDAOoTUGcxtnICIHISs5xZrfvtjjJ6g+8lg0
         CeL58TJ2SfG5nBqFTld0FBFUdGBUzBvcuyCSEv68SzY8VwBygEDm4JCN7CXqfFlErmxT
         9D4hdeqDIXYdhbS4kwWRVDWxFgF6Wn/S/CIv4B/KGih/lRmYIFRmKrRGPOh/sEYcvaMr
         e5sItGee1rmclxyQ+z9RryIGzihFkUsMCeT5mGqDLcA8aOEf8y4wuwCA2/K8HLTxdP9L
         JlDw==
X-Gm-Message-State: AFqh2koBn4tzzDoYe0ll3d4OKVzkGElfvyr5351qNViGjBW6TYpziICl
	JKB/PZ37icNBdvv5hRD16ZAVYg==
X-Google-Smtp-Source: AMrXdXsqd4B2onkPisCRhs3U7HUpP89IIwJcmA1M3HjkuwBa8tU/6aBQMGlqcgSUNzu/8jzimUQQ0g==
X-Received: by 2002:a05:6a00:1ca3:b0:582:ec3a:5145 with SMTP id y35-20020a056a001ca300b00582ec3a5145mr4434522pfw.6.1672872187795;
        Wed, 04 Jan 2023 14:43:07 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id j1-20020a62c501000000b00581d48ad9b0sm12101331pfg.154.2023.01.04.14.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 14:43:06 -0800 (PST)
Message-ID: <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
Date: Wed, 4 Jan 2023 14:43:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Andy Chiu <andy.chiu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Kito Cheng <kito.cheng@sifive.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <87sfy5ndid.fsf@oldenburg.str.redhat.com>
 <CABvJ_xjSREsdemJkCJMGSx+09jrNoSbXCwuxF0zEQmZtHrWMvg@mail.gmail.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_144316_661364_54E5D9E3 
X-CRM114-Status: GOOD (  16.90  )
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

CgpPbiAxLzQvMjMgMTM6MjksIFBoaWxpcHAgVG9tc2ljaCB3cm90ZToKPj4+PiBUaGUgbmV3IEtj
b25maWcgQ09ORklHX1JJU0NWX1ZTVEFURV9JTklUX0FMTCBzZWVtcyBsaWtlIGEKPj4+PiBoYWNr
IGJvbHRlZCBvbiB0b3AuCj4+PiBJSVVDLCBtb3N0IG9waW5pb25zIHN1Z2dlc3RlZCB0aGF0IHdl
IHNob3VsZCBrZWVwIHRoZSBkZWZhdWx0IFZlY3Rvcgo+Pj4gc3RhdGUgdG8gT04gaW4gdGhyZWFk
Ogo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIwOTIxMjE0NDM5LjE0OTE1MTAt
MTctc3RpbGxzb25Acml2b3NpbmMuY29tL1QvI3UKPj4gQWN0dWFsbHkgY29tbXVuaXR5IGZlZWRi
YWNrIGlzIHRoYXQgdGhleSAqZG9uJ3QgKiB3YW50IHRoZSBkZWZhdWx0Cj4+IHZlY3RvciBzdGF0
ZSB0byBiZSBvbiBkdWUgdG8gcG93ZXIgaW1wbGljYXRpb25zLCBpbmNyZWFzZWQgc3RhY2sgYW5k
Cj4+IG1lbW9yeSB1c2FnZSBmb3IgdmVjdG9yIGNvbnRlbnRzIChpbiB0aGF0IHRocmVhZCBhbmQg
ZWxzZSB3aGVyZSBhcwo+PiB3ZWxsKS4gU28gd2Ugc2hvdWxkIGtlZXAgaXQgZGlzYWJsZWQgYnkg
ZGVmYXVsdCwgYnV0IGluZGVlZCB3ZSBjb3VsZAo+PiBoYXZlIHRoYXQgS2NvbmZpZyBvcHRpb24g
dG8gZW5hYmxlIGl0LiBHcmFudGVkIGRpc3RybyBrZXJuZWxzIHdpbGwga2VlcAo+PiBpdCBkaXNh
YmxlZCBieSBkZWZhdWx0LCB0aGlzIGxldHMgdmVuZG9ycyBlbmFibGUgaXQgc2VsZWN0aXZlbHkg
dW50aWwKPj4gdGhlIGZ1bGwgdXNlcnNwYWNlIGVuYWJsaW5nIGJpdHMgYXJlIGluIHBsYWNlLgo+
IFNob3VsZCB3ZSBwdW50IHRoaXMgdG8gdGhlIEVMRiAoZS5nLiwgdXNpbmcgYSBSSVNDLVYgc3Bl
Y2lmaWMKPiBhdHRyaWJ1dGUpIGFuZCB0YWtlIGEgcGVyLXByb2Nlc3MgZGVjaXNpb24gb24gd2hl
dGhlciB0byBzdGFydCBpbiBPTgo+IG9yIE9GRj8KPiBJIGRvbid0IGZlZWwgZnVsbHkgY29tZm9y
dGFibGUgd2l0aCBhIEtDT05GSUcgdGhhdCBjb3VsZCBjaGFuZ2UgYW5kCj4gaW52YWxpZGF0ZSB0
aGUgYXNzdW1wdGlvbnMgYSB1c2Vyc3BhY2UgcHJvY2VzcyBjb3VsZCBoYXZlIG1hZGXigKYKClRo
ZSBLY29uZmlnIGlzIGp1c3QgYSBzdG9wIGdhcCBmb3IgdmVuZG9ycyB0byBlbmFibGUgViBkZXZl
bG9wbWVudCB3aGlsZSAKdGhlIGZ1bGwgdXNlcnNwYWNlIHN0dWZmIGlzIHNvcnRlZCBvdXQuCgpJ
bmRlZWQgUklTQ1ZfQVRUUklCVVRFUyBzZWN0aW9uIGhhcyAtbWFyY2ggaW5mbywgYnV0IHdlIG5l
ZWQgdG8gZG8gc29tZSAKZGV2ZWxvcG1lbnQgYXJvdW5kIGl0IHRvIHBhcnNlIGl0IGFuZCB1c2Ug
aXQuClRoZXJlIGFyZSBzdGlsbCBjb3JuZXIgY2FzZXMgc3VjaCBhcyBub24tViBleGVjdXRhYmxl
IGRsb3BlbiBhIGRzbyAtIHNvIAprZXJuZWwgZWxmIHBhcnNlciBkb2luZyB0aGlzIG1pZ2h0IG5v
dCBjb3ZlciBhbGwgY2FzZXMuClNpbWlsYXIgbG9naWMgd2lsbCBuZWVkIHRvIGJlIGFkZGVkIHRv
IGdsaWJjIGxvYWRlciAtIGV2ZW50dWFsbHkuCgpBZGRpbmcgdGhlIGZ1bGwgcGx1bWJpbmcgaXMg
YSBjaGlja2VuLWFuZC1lZ2cgcHJvYmxlbS4KCgo+IEFsdGVybmF0aXZlbHksIHdlIGNvdWxkIGVz
dGFibGlzaCB0aGUgY29udmVudGlvbiBvZiBoYXZpbmcgdHdvIHN0dWIKPiBsaWJyYXJpZXMgdGhh
dCBzZXQgdXAgZWl0aGVyIGVuYWJsZWQgb3IgZGlzYWJsZSBzdGF0ZSBmcm9tIHRoZWlyCj4gLmlu
aXRfYXJyYXkgdG8gcHJvdmlkZSBhIG1lY2hhbmlzbSBmb3IgZm9sa3MgdGhhdCB3YW50IHRvIG1h
a2UgYW4KPiBleHBsaWNpdCBhc3N1bXB0aW9uLiAgQWx0aG91Z2ggdGhpcyBtYXkgdHJ5IHRvIG92
ZXJkZXNpZ24gYSBzb2x1dGlvbgo+IGZvciBhIG5vbi1pc3N1ZS4KCkkgd2FzIHRoaW5raW5nIG1v
cmUgYWxvbmcgdGhlIGxpbmVzIG9mIHg4NiBHTElCQ19UVU5BQkxFUyB0byBlbmFibGUgaXQgCnZp
YSBlbnYvc3ViLXNoZWxsIG9uIGEgcGVyLXRhc2sgYmFzaXMgLSB0aGUgdHVuYWJsZSBob29rIGNv
dWxkIGluIHR1cm4gCnZlcmlmeSB0aGF0IFZlY3RvciBzdXBwb3J0IGRvZXMgZXhpc3QgLSBvciBp
dCBjb3VsZCBpbnZva2UgdGhlIHByY3RsIAp1bmNvbmRpdGlvbmFsbHkgKHdoaWNoIHdvdWxkIGZh
aWwgaWYgViBkaWRuJ3QgZXhpc3QgZXRjKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
