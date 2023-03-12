Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59684C6FA99
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Mar 2023 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJbf0Y9k23PaGUvROZx+UigdLWCBSa7iSsKWWh2AP4w=; b=nC1ARLOwFDmRfK
	1qdm35VKMvzF7xNwaIRb4000hVYifwFdWHUyuAR3nzXOZ8+MyS7hyIoPzQpL4bO0HYZSAfB0mpzPw
	1GXdcDWICdHTX/qBzej5az2x2eSxiNZgGrHtyMlU/5I/UdsYVscW3n/EBu+W0FmOhpf3PnAazaDbY
	7ABJ9MZd9q6slDCd15wo7+bR4VGs8tB5dURfq+IaVlJlcyHQ6ac/Ia9vf/WfrRBRGg3Cf88XYxLb2
	moLqCWyE2eoR3tJnsWnwG+E5vsxD+VlNIwVkMiKld4t7d4c5QNKF9ZelWaSDElfnraGpi3PLZ7+Ej
	GUag/GyzyimvTvU4uhRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLCh-002FyT-7l; Sun, 12 Mar 2023 12:53:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbLCd-002FxP-Fs
	for linux-riscv@lists.infradead.org; Sun, 12 Mar 2023 12:53:33 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o4so2383534pjq.4
        for <linux-riscv@lists.infradead.org>; Sun, 12 Mar 2023 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678625606;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ATgDgy1YTPU2yW43mYyw7dC0tKBfIzV3TlqnkOH7iBI=;
        b=U3A/FbdVQfj/Zb5NKClBsDRX8zHQWsQ01gYUJaP9pzjPr1kdFEWUuNyF6zGzFUljLO
         xfOQN8aIXzTmebRrcicoo0TLRvQzwbBaXehdq1uYsPla8fwwXc2Jc81P2Bbjw7Qrxb1W
         YJezBRm/Ao5fp4jDa8POoMkOjajgZ97OtJryeIGAn3rSvJlPOIRU2vppwSXfTzpBovAv
         ZWz4LTb1fGbLJ2XSnS2DKYZkCkis6hvh4VLQdKKw5o51r47eirehjNbOakQVysrn8NSq
         nDvlLWTLh0lszouxpBbiOFYKsuy/PHq681mq/mz4JD8rLKTMRC8MbYorSSv6ezqEp/1r
         iF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678625606;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATgDgy1YTPU2yW43mYyw7dC0tKBfIzV3TlqnkOH7iBI=;
        b=tMmNG2ocaPEc9g6mM4i1u93rPut/JaYxmNXTc4ZQcmjexJsPwb2nguYxVx4w4NmRTe
         MjgsMziZA0IxD6/PhacMqhApNiTBy/eTNDmWyQaQO6Vt30v3QZr7mhrT0ahTOKvaLMn1
         aaVdL0i6TQH4OgCfNy1yQyAnui7XKI+ZncNiOwJXJ9K6sA5KRfN7TiSQ7nV5brhPW+y7
         MdAQT+bDnBXxcvquz3IGb5WwkyZypNnR7sdnc8NczlOyXYTz9LxqiUc2ifhNbYoTRmDW
         kr96GD5d/mxHYg+TmSc5WANomldF2bbbg/7Slb+bJnVYtPa7EdiEvoqo+Wi3dBwKO8pm
         ET4Q==
X-Gm-Message-State: AO0yUKWPOQPwNyGI8XhlVxNJiVRzZylclYCdNVhE2Gm08+BpwrMfFtjf
	ZIBQ9YVT7RlWf4+ZH+858js=
X-Google-Smtp-Source: AK7set9kvWbjXtPP3Sg5OrWmtGV7gQVyFRpy/Txku4ZV68BJbbmIbZvyEYj2BRLUf4Zs0UC+jD62rw==
X-Received: by 2002:a05:6a20:1609:b0:cc:d44a:bec2 with SMTP id l9-20020a056a20160900b000ccd44abec2mr36996877pzj.1.1678625606091;
        Sun, 12 Mar 2023 05:53:26 -0700 (PDT)
Received: from [192.168.50.71] ([118.32.98.101])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a000bea00b005ded4825201sm2716387pfu.112.2023.03.12.05.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 05:53:25 -0700 (PDT)
Message-ID: <09d44d74-f3c9-cf99-8d14-74499485e956@gmail.com>
Date: Sun, 12 Mar 2023 21:53:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] perf tools riscv: Add support for riscv
 lookup_binutils_path
Content-Language: en-US
To: Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>
References: <20230311112122.28894-1-p4ranlee@gmail.com>
 <CAP-5=fWkAqX+Uy_XhXHjEx6sj-wpOJ+WQf=vMtRzRBS-0Kj32Q@mail.gmail.com>
From: Paran Lee <p4ranlee@gmail.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
In-Reply-To: <CAP-5=fWkAqX+Uy_XhXHjEx6sj-wpOJ+WQf=vMtRzRBS-0Kj32Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_055331_923713_72A3C9B5 
X-CRM114-Status: GOOD (  25.79  )
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

CgoyMy4gMy4gMTIuIDE1OjI37JeQIElhbiBSb2dlcnMg7J20KOqwgCkg7JO0IOq4gDoKPiBPbiBT
YXQsIE1hciAxMSwgMjAyMyBhdCAzOjIy4oCvQU0gcGFyYW5sZWUgPHA0cmFubGVlQGdtYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IEFkZCB0byBrbm93IFJJU0MtViBiaW51dGlscyBwYXRoLgo+PiBTZWNv
bmRhcmlseSwgZWRpdCB0aGUgY29kZSBibG9jayB3aXRoIGFscGhhYmV0aWNhbCBvcmRlci4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogUGFyYW4gTGVlIDxwNHJhbmxlZUBnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgdG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jIHwgNTEgKysrKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5j
IGIvdG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jCj4+IGluZGV4IDU5ZGQ4NzVmZDVlNC4uMDU4NTI3
ZWRlZGRkIDEwMDY0NAo+PiAtLS0gYS90b29scy9wZXJmL2FyY2gvY29tbW9uLmMKPj4gKysrIGIv
dG9vbHMvcGVyZi9hcmNoL2NvbW1vbi5jCj4+IEBAIC0yOSwxMSArMjksMjMgQEAgY29uc3QgY2hh
ciAqY29uc3QgYXJtX3RyaXBsZXRzW10gPSB7Cj4+ICB9Owo+Pgo+PiAgY29uc3QgY2hhciAqY29u
c3QgYXJtNjRfdHJpcGxldHNbXSA9IHsKPj4gKyAgICAgICAiYWFyY2g2NC11bmtub3duLWxpbnV4
LSIsCj4gCj4gTW9kaWZ5aW5nIEFSTTY0IGJlaGF2aW9yIHNob3VsZCBiZSBhIHNlcGFyYXRlIGNo
YW5nZS4KPiAKPj4gICAgICAgICAiYWFyY2g2NC1saW51eC1hbmRyb2lkLSIsCj4+ICAgICAgICAg
ImFhcmNoNjQtbGludXgtZ251LSIsCj4+ICAgICAgICAgTlVMTAo+PiAgfTsKPj4KPj4gK2NvbnN0
IGNoYXIgKmNvbnN0IG1pcHNfdHJpcGxldHNbXSA9IHsKPj4gKyAgICAgICAibWlwcy11bmtub3du
LWxpbnV4LWdudS0iLAo+PiArICAgICAgICJtaXBzZWwtbGludXgtYW5kcm9pZC0iLAo+PiArICAg
ICAgICJtaXBzLWxpbnV4LWdudS0iLAo+PiArICAgICAgICJtaXBzNjQtbGludXgtZ251LSIsCj4+
ICsgICAgICAgIm1pcHM2NGVsLWxpbnV4LWdudWFiaTY0LSIsCj4+ICsgICAgICAgIm1pcHM2NC1s
aW51eC1nbnVhYmk2NC0iLAo+PiArICAgICAgICJtaXBzZWwtbGludXgtZ251LSIsCj4+ICsgICAg
ICAgTlVMTAo+PiArfTsKPj4gKwo+IAo+IFRoaXMgd2lsbCBhZmZlY3QgdGhlIGJsYW1lIGhpc3Rv
cnkuIEl0IHNob3VsZCBwcm9iYWJseSBiZSBpdHMgb3duIGNoYW5nZSB0b28uCgpUaGFuayB5b3Ug
Zm9yIHJldmlldyEgSSBhZ3JlZS4gU28gSSB3b3VsZCBzcGxpdCB0aGUgcGF0Y2guCgo+PiAtCj4+
ICBzdGF0aWMgYm9vbCBsb29rdXBfcGF0aChjaGFyICpuYW1lKQo+PiAgewo+PiAgICAgICAgIGJv
b2wgZm91bmQgPSBmYWxzZTsKPj4gQEAgLTE2NCwxOCArMTc5LDIyIEBAIHN0YXRpYyBpbnQgcGVy
Zl9lbnZfX2xvb2t1cF9iaW51dGlsc19wYXRoKHN0cnVjdCBwZXJmX2VudiAqZW52LAo+PiAgICAg
ICAgICAgICAgICAgcGF0aF9saXN0ID0gYXJtX3RyaXBsZXRzOwo+PiAgICAgICAgIGVsc2UgaWYg
KCFzdHJjbXAoYXJjaCwgImFybTY0IikpCj4+ICAgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBh
cm02NF90cmlwbGV0czsKPj4gKyAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJtaXBzIikp
Cj4+ICsgICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBtaXBzX3RyaXBsZXRzOwo+PiAgICAgICAg
IGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInBvd2VycGMiKSkKPj4gICAgICAgICAgICAgICAgIHBh
dGhfbGlzdCA9IHBvd2VycGNfdHJpcGxldHM7Cj4+IC0gICAgICAgZWxzZSBpZiAoIXN0cmNtcChh
cmNoLCAic2giKSkKPj4gLSAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IHNoX3RyaXBsZXRzOwo+
PiArICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInJpc2N2MzIiKSkKPj4gKyAgICAgICAg
ICAgICAgIHBhdGhfbGlzdCA9IHJpc2N2MzJfdHJpcGxldHM7Cj4+ICsgICAgICAgZWxzZSBpZiAo
IXN0cmNtcChhcmNoLCAicmlzY3Y2NCIpKQo+PiArICAgICAgICAgICAgICAgcGF0aF9saXN0ID0g
cmlzY3Y2NF90cmlwbGV0czsKPj4gICAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJzMzkw
IikpCj4+IC0gICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBzMzkwX3RyaXBsZXRzOwo+PiArICAg
ICAgICAgICAgICAgcGF0aF9saXN0ID0gczM5MF90cmlwbGV0czsKPiAKPiB3aGl0ZXNwYWNlIGlz
c3VlPwoKSSB0cmllZCB0byBjb3JyZWN0IHRoZSBhbHBoYWJldGljYWwgb3JkZXIgYmVjYXVzZSBp
dCB3YXMgdmFndWVseSBzb3J0ZWQuCkFuZCBJJ2xsIHRyeSB0byB3b3JrIG9uIGJsYW1lIGhpc3Rv
cnkgb24gZWFjaCBhcmNoIGNvZGUgYmxvY2sgYXMgd2VsbC4KCj4+ICsgICAgICAgZWxzZSBpZiAo
IXN0cmNtcChhcmNoLCAic2giKSkKPj4gKyAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9IHNoX3Ry
aXBsZXRzOwo+PiAgICAgICAgIGVsc2UgaWYgKCFzdHJjbXAoYXJjaCwgInNwYXJjIikpCj4+ICAg
ICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBzcGFyY190cmlwbGV0czsKPj4gICAgICAgICBlbHNl
IGlmICghc3RyY21wKGFyY2gsICJ4ODYiKSkKPj4gICAgICAgICAgICAgICAgIHBhdGhfbGlzdCA9
IHg4Nl90cmlwbGV0czsKPj4gLSAgICAgICBlbHNlIGlmICghc3RyY21wKGFyY2gsICJtaXBzIikp
Cj4+IC0gICAgICAgICAgICAgICBwYXRoX2xpc3QgPSBtaXBzX3RyaXBsZXRzOwo+PiAgICAgICAg
IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAgdWlfX2Vycm9yKCJiaW51dGlscyBmb3IgJXMgbm90
IHN1cHBvcnRlZC5cbiIsIGFyY2gpOwo+PiAgICAgICAgICAgICAgICAgZ290byBvdXRfZXJyb3I7
Cj4gCj4gSSB0aGluayBpbiBnZW5lcmFsIHdlIG5lZWQgdG8gcmV2YW1wIHRoaXMgY29kZS4gVHdv
IHRoaW5ncyB0aGF0IEkgc2VlCj4gdGhhdCBhcmUgbWlzc2luZyBhcmUgKDEpIHN1cHBvcnQgZm9y
IHBlcmYgY29uZmlnIGFuZCAoMikgYWRkcjJsaW5lCj4gc2hvdWxkIGJlIGNvbmZpZ3VyYWJsZSwg
eW91IG1heSB3YW50IGxsdm0tYWRkcjJsaW5lLiBBZGRpbmcgUklTQy1WIGlzCj4gb2YgY291cnNl
IGltcG9ydGFudCB0b28gOi0pCj4gCj4gVGhhbmtzLAo+IElhbgoKTWF5IEkgYXNrIGRvY3VtZW50
YXRpb24gb3IgaGludCB0aGF0IEkgY2FuIGhlbHAgd29yayB3aXRoPwoKUC5TLgoKSSdtIGludGVy
ZXN0ZWQgaW4gdGhlIEdvb2dsZSBTdW1tZXIgT2YgY29kZSBwZXJmIGNhdGVnb3J5IHRoaXMgeWVh
ciwKZXNwZWNpYWxseSB0aGUgcGFydCBhYm91dCByaXNjLXYgYXJjaGl0ZWN0dXJlLCBJIHJlY2Vu
dGx5IHB1cmNoYXNlZCBhCmRldmVsb3BtZW50IGJvYXJkIGFuZCB3b3VsZCBsaWtlIHRvIGJlIGFi
bGUgdG8gdGVzdCBwZXJmIG9uIGEgU2lmaXZlIFU3NApDUFUgYmFzZWQgZW52aXJvbm1lbnQuCkJ1
dCBJJ3ZlIG9ubHkgdXNlZCBwZXJmIHdpdGggY29tbWFuZCB0b29sIGFuZCBkb24ndCBrbm93IG11
Y2ggYWJvdXQgdGhlCmludGVybmFscywgc28gaWYgdGhlcmUgaXMgYSByb2FkbWFwIGZvciBwZXJm
IGRldmVsb3BtZW50IG9yCmNvbnRyaWJ1dGlvbiwgSSBoYXZlIGludGVyZXN0IGluIHBlcmYgaW50
ZXJuYWxzIGJvdGgga2VybmVsIGFuZCB1c2VyIHNpZGUuCk1heSBJIGFzayBpbmZvcm1hdGlvbiB0
byBhcHBseT8KSSBhbSBkZXZlbG9waW5nIExpbnV4IFNlY3VyaXR5IERyaXZlciBkcml2ZXJzIGZv
ciBhIHNlY3VyaXR5IGNvbXBhbnkuCgpCUgpQYXJhbiBMZWUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
