Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11E3DC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 05:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpmNz2MlBlYYgQYncyzXhkzsy0w+YlCdvhSVZ0qIivc=; b=A83N1R49lboJdQ
	WlWvqEza6MDyR7BAgi6pL6HcCPtXWdmv+Bb8INxUoq28gK3l8mRDFCZCCpS1eaRezLxRyMBomNQlb
	FXbW0EO3IxcLnXa9Yip3IGnEWISFpfVQzzyNf1UNVotY4K0tJ2aBOomYbwM4TWgrArN9srkGUchXu
	NZfqbCeG1dFfJsGYPayHoT6SFpy9I1Bai2IQ9ykYBZJRKumYxt5pU3+rEWnJgRZe+d63WL6VveTfE
	oV/xxWygOVWVXnA5qct+QFSlj6IMXFXLzYPBexk27GNDISEq+FGPNJ9fkbhUROLW/JGzHa9cSFF0g
	PjZ//NVg9IunJZkPpKGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymIS-0000000C8SH-24Ah;
	Mon, 22 Apr 2024 05:32:56 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rymIP-0000000C8Px-0hf8
	for linux-riscv@lists.infradead.org;
	Mon, 22 Apr 2024 05:32:54 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-7da4373f850so161234439f.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Apr 2024 22:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1713763970; x=1714368770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mSLO7qsMu9ScrRVYm3QHz5Wa7uqrp1Jo4sRqwEm41k=;
        b=abE4mqzrU275YXn/CGm3MHzov9kwwvRuMv/1TrrqRH4GESGpp0Ev3VeMGSsvq5THza
         Fy3egcKzL7krBjU+E99IdQg5GmuNlg26BqAJP+08WdA7qtnuCzwkwJ4vaeusH/nJ75bs
         AX93mwqrPGw0+Xh6bd5b/7s+IhirBo7dk9khZUjWI5TXzIRdoFiKqgOoftNumpaXXgOC
         eCMNkiC/dxvKisylOREUsovDmvLqAXpPPRE4Drw6pgQG+Psb/RP1UlrGjCvR1+viVdK0
         ExhC8TxlXCsawWhT9lvcxzyJLMnlj3H3LSeai46K0yDOwL2uVMjX1nNtgzTY5AqRHTCF
         auYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713763970; x=1714368770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mSLO7qsMu9ScrRVYm3QHz5Wa7uqrp1Jo4sRqwEm41k=;
        b=iI47tvuoyDSUE8Ef5Re7OnPqP7LFrBV7xrHonU8BTboWz9fuX/m0DYqrYzpLGeRJzv
         TscXRRZlWEP5MiWdbb0r61O3wOqASC/a9Tt9HL3UvYGHtWzs1G74eE6YGyoDeTn3aVNG
         FzKK2m0QqGa6mXtDSIxsOuERKjakIC47701TloAq9yGVzn7HAGzM57/JStgU5lBa6jcw
         c1FR5udDB7gN+AoENOGuSGfQUtztnhvULxZKzvA89vQvna4gNhxym+SW9iZKJJ5TLW9t
         c2PNNSvFMpBtKqGjDIBzYQ3uknqUYOrxbTb+KPaHSnh9Jr4zN8lDQqVsL7uZmv1r/Q3/
         7o+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBddOjGSvTYNEiDLHCiE9JXPCa5dhEJiogP6b0IjVHttPQblBU/w40lmjcken8xQpEO8BPNkquQxQXVKl1JlePxvxZJumn3Zs8/dSwJ2d7
X-Gm-Message-State: AOJu0YwCP9Oh23X4LCQSAlOqpmZgEtFkZKFnBkcxTC8SITkb5YB1jNif
	WD9yxp1dM3+eXx+Ic8QwZBQIUAjuPTyal07j9vRi1BtHTd9/DyUDz4adOABhbaOBBcmr+waCZI3
	3toMtDZ2SDjS7uWobh16h9jB5gExxtuOFLXzEYw==
X-Google-Smtp-Source: AGHT+IEqy96d9EYvPfCKQbMdPNUPl6DZT781YdOhP9O47wLCNvRvtopYWldFwJankgX0sYeovuf51APBEHy0ooQ/k/Q=
X-Received: by 2002:a05:6e02:144d:b0:36a:686:b3bf with SMTP id
 p13-20020a056e02144d00b0036a0686b3bfmr13479495ilo.17.1713763970407; Sun, 21
 Apr 2024 22:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-25-atishp@rivosinc.com>
In-Reply-To: <20240420151741.962500-25-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 11:02:39 +0530
Message-ID: <CAAhSdy0Bo1+SomNva+A_Phd=gu_+wcqXTV_-ioqCCVEr1cXJBA@mail.gmail.com>
Subject: Re: [PATCH v8 24/24] KVM: riscv: selftests: Add commandline option
 for SBI PMU test
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, samuel.holland@sifive.com, 
	Conor Dooley <conor.dooley@microchip.com>, Juergen Gross <jgross@suse.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Rutland <mark.rutland@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Shuah Khan <shuah@kernel.org>, virtualization@lists.linux.dev, 
	Will Deacon <will@kernel.org>, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_223253_221452_FA0FB5BE 
X-CRM114-Status: GOOD (  19.89  )
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

T24gU2F0LCBBcHIgMjAsIDIwMjQgYXQgNToxOOKAr0FNIEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IFNCSSBQTVUgdGVzdCBjb21wcmlzZXMgb2YgbXVsdGlwbGUg
dGVzdHMgYW5kIHVzZXIgbWF5IHdhbnQgdG8gcnVuCj4gb25seSBhIHN1YnNldCBkZXBlbmRpbmcg
b24gdGhlIHBsYXRmb3JtLiBUaGUgbW9zdCBjb21tb24gY2FzZSB3b3VsZAo+IGJlIHRvIHJ1biBh
bGwgdG8gdmFsaWRhdGUgYWxsIHRoZSB0ZXN0cy4gSG93ZXZlciwgc29tZSBwbGF0Zm9ybSBtYXkK
PiBub3Qgc3VwcG9ydCBhbGwgZXZlbnRzIG9yIGFsbCBJU0EgZXh0ZW5zaW9ucy4KPgo+IFRoZSBj
b21tYW5kbGluZSBvcHRpb24gYWxsb3dzIHVzZXIgdG8gZGlzYWJsZSBhbnkgc2V0IG9mIHRlc3Rz
IGlmCj4gdGhleSB3YW50IHRvLgo+Cj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25l
c0B2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBA
cml2b3NpbmMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgLi4uL3NlbGZ0ZXN0cy9rdm0vcmlz
Y3Yvc2JpX3BtdV90ZXN0LmMgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKy0tLQo+ICAxIGZp
bGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMgYi90
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMKPiBpbmRleCAw
ZmQ5Yjc2YWU4MzguLjY5YmI5NGU2YjIyNyAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vcmlzY3Yvc2JpX3BtdV90ZXN0LmMKPiBAQCAtMzMsNiArMzMsMTMgQEAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcgY291bnRlcl9tYXNrX2F2YWlsYWJsZTsKPgo+ICBzdGF0aWMgYm9v
bCBpbGxlZ2FsX2hhbmRsZXJfaW52b2tlZDsKPgo+ICsjZGVmaW5lIFNCSV9QTVVfVEVTVF9CQVNJ
QyAgICAgQklUKDApCj4gKyNkZWZpbmUgU0JJX1BNVV9URVNUX0VWRU5UUyAgICBCSVQoMSkKPiAr
I2RlZmluZSBTQklfUE1VX1RFU1RfU05BUFNIT1QgIEJJVCgyKQo+ICsjZGVmaW5lIFNCSV9QTVVf
VEVTVF9PVkVSRkxPVyAgQklUKDMpCj4gKwo+ICtzdGF0aWMgaW50IGRpc2FibGVkX3Rlc3RzOwo+
ICsKPiAgdW5zaWduZWQgbG9uZyBwbXVfY3NyX3JlYWRfbnVtKGludCBjc3JfbnVtKQo+ICB7Cj4g
ICNkZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgICB7
XAo+IEBAIC02MDgsMTkgKzYxNSw2NyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3ZtX2V2ZW50c19vdmVy
Zmxvdyh2b2lkICpndWVzdF9jb2RlKQo+ICAgICAgICAgdGVzdF92bV9kZXN0cm95KHZtKTsKPiAg
fQo+Cj4gLWludCBtYWluKHZvaWQpCj4gK3N0YXRpYyB2b2lkIHRlc3RfcHJpbnRfaGVscChjaGFy
ICpuYW1lKQo+ICt7Cj4gKyAgICAgICBwcl9pbmZvKCJVc2FnZTogJXMgWy1oXSBbLWQgPHRlc3Qg
bmFtZT5dXG4iLCBuYW1lKTsKPiArICAgICAgIHByX2luZm8oIlx0LWQ6IFRlc3QgdG8gZGlzYWJs
ZS4gQXZhaWxhYmxlIHRlc3RzIGFyZSAnYmFzaWMnLCAnZXZlbnRzJywgJ3NuYXBzaG90JywgJ292
ZXJmbG93J1xuIik7Cj4gKyAgICAgICBwcl9pbmZvKCJcdC1oOiBwcmludCB0aGlzIGhlbHAgc2Ny
ZWVuXG4iKTsKPiArfQo+ICsKPiArc3RhdGljIGJvb2wgcGFyc2VfYXJncyhpbnQgYXJnYywgY2hh
ciAqYXJndltdKQo+ICt7Cj4gKyAgICAgICBpbnQgb3B0Owo+ICsKPiArICAgICAgIHdoaWxlICgo
b3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJoZDoiKSkgIT0gLTEpIHsKPiArICAgICAgICAgICAg
ICAgc3dpdGNoIChvcHQpIHsKPiArICAgICAgICAgICAgICAgY2FzZSAnZCc6Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFzdHJuY21wKCJiYXNpYyIsIG9wdGFyZywgNSkpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxlZF90ZXN0cyB8PSBTQklfUE1VX1RFU1Rf
QkFTSUM7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAoIXN0cm5jbXAoImV2ZW50
cyIsIG9wdGFyZywgNikpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkaXNhYmxl
ZF90ZXN0cyB8PSBTQklfUE1VX1RFU1RfRVZFTlRTOwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGVsc2UgaWYgKCFzdHJuY21wKCJzbmFwc2hvdCIsIG9wdGFyZywgOCkpCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBkaXNhYmxlZF90ZXN0cyB8PSBTQklfUE1VX1RFU1RfU05BUFNI
T1Q7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZWxzZSBpZiAoIXN0cm5jbXAoIm92ZXJmbG93
Iiwgb3B0YXJnLCA4KSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRpc2FibGVk
X3Rlc3RzIHw9IFNCSV9QTVVfVEVTVF9PVkVSRkxPVzsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIGNhc2UgJ2gnOgo+
ICsgICAgICAgICAgICAgICBkZWZhdWx0Ogo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
ZG9uZTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVy
biB0cnVlOwo+ICtkb25lOgo+ICsgICAgICAgdGVzdF9wcmludF9oZWxwKGFyZ3ZbMF0pOwo+ICsg
ICAgICAgcmV0dXJuIGZhbHNlOwo+ICt9Cj4gKwo+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAq
YXJndltdKQo+ICB7Cj4gLSAgICAgICB0ZXN0X3ZtX2Jhc2ljX3Rlc3QodGVzdF9wbXVfYmFzaWNf
c2FuaXR5KTsKPiAtICAgICAgIHByX2luZm8oIlNCSSBQTVUgYmFzaWMgdGVzdCA6IFBBU1NcbiIp
Owo+ICsgICAgICAgaWYgKCFwYXJzZV9hcmdzKGFyZ2MsIGFyZ3YpKQo+ICsgICAgICAgICAgICAg
ICBleGl0KEtTRlRfU0tJUCk7Cj4gKwo+ICsgICAgICAgaWYgKCEoZGlzYWJsZWRfdGVzdHMgJiBT
QklfUE1VX1RFU1RfQkFTSUMpKSB7Cj4gKyAgICAgICAgICAgICAgIHRlc3Rfdm1fYmFzaWNfdGVz
dCh0ZXN0X3BtdV9iYXNpY19zYW5pdHkpOwo+ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJTQkkg
UE1VIGJhc2ljIHRlc3QgOiBQQVNTXG4iKTsKPiArICAgICAgIH0KPgo+IC0gICAgICAgdGVzdF92
bV9ldmVudHNfdGVzdCh0ZXN0X3BtdV9ldmVudHMpOwo+IC0gICAgICAgcHJfaW5mbygiU0JJIFBN
VSBldmVudCB2ZXJpZmljYXRpb24gdGVzdCA6IFBBU1NcbiIpOwo+ICsgICAgICAgaWYgKCEoZGlz
YWJsZWRfdGVzdHMgJiBTQklfUE1VX1RFU1RfRVZFTlRTKSkgewo+ICsgICAgICAgICAgICAgICB0
ZXN0X3ZtX2V2ZW50c190ZXN0KHRlc3RfcG11X2V2ZW50cyk7Cj4gKyAgICAgICAgICAgICAgIHBy
X2luZm8oIlNCSSBQTVUgZXZlbnQgdmVyaWZpY2F0aW9uIHRlc3QgOiBQQVNTXG4iKTsKPiArICAg
ICAgIH0KPgo+IC0gICAgICAgdGVzdF92bV9ldmVudHNfc25hcHNob3RfdGVzdCh0ZXN0X3BtdV9l
dmVudHNfc25hcGhvc3QpOwo+IC0gICAgICAgcHJfaW5mbygiU0JJIFBNVSBldmVudCB2ZXJpZmlj
YXRpb24gd2l0aCBzbmFwc2hvdCB0ZXN0IDogUEFTU1xuIik7Cj4gKyAgICAgICBpZiAoIShkaXNh
YmxlZF90ZXN0cyAmIFNCSV9QTVVfVEVTVF9TTkFQU0hPVCkpIHsKPiArICAgICAgICAgICAgICAg
dGVzdF92bV9ldmVudHNfc25hcHNob3RfdGVzdCh0ZXN0X3BtdV9ldmVudHNfc25hcGhvc3QpOwo+
ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJTQkkgUE1VIGV2ZW50IHZlcmlmaWNhdGlvbiB3aXRo
IHNuYXBzaG90IHRlc3QgOiBQQVNTXG4iKTsKPiArICAgICAgIH0KPgo+IC0gICAgICAgdGVzdF92
bV9ldmVudHNfb3ZlcmZsb3codGVzdF9wbXVfZXZlbnRzX292ZXJmbG93KTsKPiAtICAgICAgIHBy
X2luZm8oIlNCSSBQTVUgZXZlbnQgdmVyaWZpY2F0aW9uIHdpdGggb3ZlcmZsb3cgdGVzdCA6IFBB
U1NcbiIpOwo+ICsgICAgICAgaWYgKCEoZGlzYWJsZWRfdGVzdHMgJiBTQklfUE1VX1RFU1RfT1ZF
UkZMT1cpKSB7Cj4gKyAgICAgICAgICAgICAgIHRlc3Rfdm1fZXZlbnRzX292ZXJmbG93KHRlc3Rf
cG11X2V2ZW50c19vdmVyZmxvdyk7Cj4gKyAgICAgICAgICAgICAgIHByX2luZm8oIlNCSSBQTVUg
ZXZlbnQgdmVyaWZpY2F0aW9uIHdpdGggb3ZlcmZsb3cgdGVzdCA6IFBBU1NcbiIpOwo+ICsgICAg
ICAgfQo+Cj4gICAgICAgICByZXR1cm4gMDsKPiAgfQo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
