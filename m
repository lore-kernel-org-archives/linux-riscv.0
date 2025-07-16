Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34056C83F17
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 02:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F2m4HAURtt2o5dzQ3Gbz4b9DPV0vn2TLQ9eb90cocHk=; b=y7lwgeOq1IP4aB
	leOyAkxPR6CZK0z65UevT/DfaxbwN3fXS0bbQ8Wq/XpNvj5cK9IhOCHqpoV+WLouh1DI47PhndXtS
	4TGWJAmWBccfBx0BqoPr0mO6OYDhF4uIjkkdwuiF4sMYTCPD8Vr+Om9l5W7OYfW974b6Hf8Hv+HOz
	BklHnmPn6SoBAREao5cMDbrA7pe7WvkmW87Jug0eh8dAFEAm1Riv6fHG5K36D2qx0NsfWau+wf3hA
	web25HVK4aCPbvUIZL2ziVCNUUb0cQa/ckmfDkdXN1HS+eQkfXqQ8n97zsEnYxKskNJJNzlBdrQBx
	YxtI0z6XZ2KymUgZuI/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrXh-00000006aSq-1s8z;
	Wed, 16 Jul 2025 02:06:45 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubrXe-00000006aSA-2ZAz
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 02:06:44 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3df30d542caso26927275ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 19:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1752631601; x=1753236401; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j+F9L1888D1/lTB0yjly7TVvzjMYjvETcZUaJXOGrM=;
        b=aHrtN8l6pX0h9TsiX/f+yM425iDB0poWEri5OJksQq6pOqzezNHZh4bZ4jl1QdCffv
         edb5UObiOKs9YsbQIBNx/ViFEw46MDn8LAUJo8TphXLMC2JjxQJVDwarvrmeDl3gj45t
         8DpW0JwRi6fK1i7DlLwgnVFMjQ7W+o881qaeviHcqpYDtOKZL34xGAboPkWBlGmRyX/W
         nzmmi2/OiFKXW2diJs48ioYXW9lVo89x0Pm12Ld98xoluZCTdEcc3W5q6EQchjuOXPkO
         3A5IHq8y2QXSCIl8npcjbbHrPKxMzguCWOSloxHhjENm0ELmnfsCseLTkDmdwFUaAq1d
         DXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752631601; x=1753236401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j+F9L1888D1/lTB0yjly7TVvzjMYjvETcZUaJXOGrM=;
        b=bM0/woMs+RKZ8U18Sp5CME9/19rhLxWLaQB0t1WGbXmO4lDeADFNnAm/pZelswbcuF
         8jrBGC3cTiLmifYqOmxGWorBsz9Abw8rUzSS2Ieb3O3hwdwy16uaheDPBBkOj3szwLKF
         S0hJGAVHQLSK17jcLHgxx0iRMXRgq/j86Y8E98WpPcTfOnXEyvKk41RwmKHEjz+PfNYR
         B7lIrWvUqWMU1VOStETCYbgj+0N+F7dJHdbl8conx5LP2Cu/l5aIyckM8oKchqW+ZiI7
         dOuqOm0BQ0cCa012l3ouP72F+8EAjx5VAnk9/RTLOwM6hLBrOpK1IgBi8ILuCFlGIaJa
         R7sg==
X-Forwarded-Encrypted: i=1; AJvYcCVCjB+vjTdy9gL/3CixQKjDLK58nc7cxX92f6papzfHKV2aCVakpYP+Jd28Jx7SF77NtgpB6PsIPznMEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi0CTBCCe7VCDCLEm1chi/vu8VulrEENSYAGA0o34DXbZjzyRs
	d7nC69fkvLEoJl9nJWFzbIB8TwFEPeF7hShGGh7UjX7eBNtPmb5jUA+JLC8X9HzNcd+YKqw2Xa1
	WiAgLlf4d2y+rhbnFcpyJSbzp6cbdhVjBHMBEftQ2aQ==
X-Gm-Gg: ASbGncuV39bIwhs0mE4b9y/bQ33Amh3rldI0csJ16PjXVUIgxKx+B8Qth0votK1yPwn
	eoo866fQIMhnvGMrSUqCpeyU0tdOotoobStjQ6kONVQxrxgn7ZPFIAyGNhi7abM9L5ZVxcGMQEn
	5xW+6FLjyV+lieMBi141h39rGk9qkwUDe7w6QGbyu0NP0XCUb7evS2R5vFzDxJUT4hmywDMveDF
	N+x5jjJHsnJwxQyoSPX
X-Google-Smtp-Source: AGHT+IH9/HXYsLu/DJVcgXHmyW23optDc6uoRoN2rcWn2HHkb7B7VzOcj2uDSKGa9qQvekhhenVwxhU+VuPhiZoGO+E=
X-Received: by 2002:a05:6e02:1aa3:b0:3df:3886:ad6e with SMTP id
 e9e14a558f8ab-3e282e65b61mr10740485ab.12.1752631601151; Tue, 15 Jul 2025
 19:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-v5_user_cfi_series-v17-0-4565c2cf869f@rivosinc.com>
 <20250604-v5_user_cfi_series-v17-15-4565c2cf869f@rivosinc.com>
 <CANXhq0pRXX_OMW2g2ui-k7Z_ZT+5a8Sra8oE28nBh5B9K2L5bQ@mail.gmail.com>
 <CANXhq0p3MVLMsr_r0RWMti476pT0EMx61PQArjo2fUauTdpXaQ@mail.gmail.com> <CAKC1njRNkSfb_0pUQoH0RwJQhWTsz9sdg_3o08w-NuSO5WypcA@mail.gmail.com>
In-Reply-To: <CAKC1njRNkSfb_0pUQoH0RwJQhWTsz9sdg_3o08w-NuSO5WypcA@mail.gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 16 Jul 2025 10:06:28 +0800
X-Gm-Features: Ac12FXxQabhbT3gOiwtrnSWdGCnuEDBYfeHbjfUOFZRTxM5oaqlSklQMtx6WBCk
Message-ID: <CANXhq0oZz=TTT=py=1BO3OZf45Wg=-bFyNpn+JRLNufHceLjcQ@mail.gmail.com>
Subject: Re: [PATCH v17 15/27] riscv/traps: Introduce software check exception
 and uprobe handling
To: Deepak Gupta <debug@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_190642_685490_8C379789 
X-CRM114-Status: GOOD (  32.59  )
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

T24gV2VkLCBKdWwgMTYsIDIwMjUgYXQgNTozNOKAr0FNIERlZXBhayBHdXB0YSA8ZGVidWdAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IEhpIFpvbmcsCj4KPgo+IE9uIFRodSwgSnVuIDE5LCAyMDI1
IGF0IDc6MTbigK9QTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+
IE9uIE1vbiwgSnVuIDE2LCAyMDI1IGF0IDM6MzHigK9QTSBab25nIExpIDx6b25nLmxpQHNpZml2
ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBUaHUsIEp1biA1LCAyMDI1IGF0IDE6MTfigK9B
TSBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4g
PiB6aWNmaXNzIC8gemljZmlscCBpbnRyb2R1Y2VzIGEgbmV3IGV4Y2VwdGlvbiB0byBwcml2IGlz
YSBgc29mdHdhcmUgY2hlY2sKPiA+ID4gPiBleGNlcHRpb25gIHdpdGggY2F1c2UgY29kZSA9IDE4
LiBUaGlzIHBhdGNoIGltcGxlbWVudHMgc29mdHdhcmUgY2hlY2sKPiA+ID4gPiBleGNlcHRpb24u
Cj4gPiA+ID4KPiAuLi4uLgo+Cj4gPiA+IFdoZW4gYSB1c2VyIG1vZGUgQ0ZJIHZpb2xhdGlvbiBv
Y2N1cnMsIHRoZSBFTFAgc3RhdGUgc2hvdWxkIGJlIDEsIGFuZAo+ID4gPiB0aGUgc3lzdGVtIHRy
YXBzIGludG8gc3VwZXJ2aXNvciBtb2RlLiBEdXJpbmcgdGhpcyB0cmFwLCBzc3RhdHVzLlNQRUxQ
Cj4gPiA+IGlzIHNldCB0byAxLCBhbmQgdGhlIEVMUCBzdGF0ZSBpcyByZXNldCB0byAwLiBJZiB3
ZSBkb27igJl0IGNsZWFyCj4gPiA+IHNzdGF0dXMuU1BFTFAsIHRoZSBFTFAgc3RhdGUgd2lsbCBi
ZWNvbWUgMSBhZ2FpbiBhZnRlciBleGVjdXRpbmcgdGhlCj4gPiA+IHNyZXQgaW5zdHJ1Y3Rpb24u
IEFzIGEgcmVzdWx0LCB0aGUgc3lzdGVtIG1pZ2h0IHRyaWdnZXIgYW5vdGhlcgo+ID4gPiBmb3J3
YXJkIENGSSB2aW9sYXRpb24gdXBvbiBleGVjdXRpbmcgdGhlIG5leHQgaW5zdHJ1Y3Rpb24gaW4g
dGhlIHVzZXIKPiA+ID4gcHJvZ3JhbSwgdW5sZXNzIGl0IGhhcHBlbnMgdG8gYmUgYSBscGFkIGlu
c3RydWN0aW9uLgo+ID4gPgo+ID4gPiBUaGUgcHJldmlvdXMgcGF0Y2ggd2FzIHRlc3RlZCBvbiBR
RU1VLCBidXQgUUVNVSBkb2VzIG5vdCBzZXQgdGhlCj4gPiA+IHNzdGF0dXMuU1BFTFAgYml0IHRv
IDEgd2hlbiBhIGZvcndhcmQgQ0ZJIHZpb2xhdGlvbiBvY2N1cnMuIFRoZXJlZm9yZSwKPiA+ID4g
SSBzdXNwZWN0IHRoYXQgUUVNVSBtaWdodCBhbHNvIHJlcXVpcmUgc29tZSBmaXhlcy4KPiA+Cj4g
PiBIaSBEZWVwYWssCj4gPiBUaGUgaXNzdWUgd2l0aCBRRU1VIHdhcyB0aGF0IHRoZSBzdy1jaGVj
ayBleGNlcHRpb24gYml0IGluIG1lZGVsZWcKPiA+IGNvdWxkbid0IGJlIHNldC4gVGhpcyBoYXMg
YmVlbiBmaXhlZCBpbiB0aGUgbGF0ZXN0IFFFTVUgbWFpbmxpbmUuIEkKPiA+IGhhdmUgcmUtdGVz
dGVkIHRoZSBsYXRlc3QgUUVNVSB2ZXJzaW9uLCBhbmQgaXQgd29ya3MuCj4KPiBXaGF0IHdhcyB0
aGlzIGlzc3VlLCBjYW4geW91IHBvaW50IG1lIHRvIHRoZSBwYXRjaCBpbiBtYWlubGluZT8KCkhp
IERlZXBhawpUaGUgaXNzdWUgd2FzIHRoYXQgbXkgUUVNVSBzZXR1cCBzb21laG93IG1pc3NlZCB0
aGUgY2hhbmdlIG9mCmB0YXJnZXQvcmlzY3YvY3NyLmNgIGluIHlvdXIgZm9sbG93aW5nIHBhdGNo
OgpodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2NvbW1pdC82MDMxMTAyNDAxYWU4YTY5YTg3
YjIwZmJlYzJhYWU2NjY2MjVkOTZhCkFmdGVyIEkgdXBncmFkZWQgdG8gdGhlIGxhdGVzdCBRRU1V
IHNvdXJjZSwgSSBmb3VuZCB0aGUga2VybmVsIGlzc3VlCmlmIHdlIGRpZG4ndCBjbGVhciBzc3Rh
dHVzLlNQRUxQIGluIHRoZSBoYW5kbGVyClRoYW5rcwoKPgo+ID4KPiA+ID4KPiA+ID4gVGhhbmtz
Cj4gPiA+Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgaWYgKGlzX2ZjZmkgfHwgaXNfYmNmaSkg
ewo+ID4gPiA+ICsgICAgICAgICAgICAgICBkb190cmFwX2Vycm9yKHJlZ3MsIFNJR1NFR1YsIFNF
R1ZfQ1BFUlIsIHJlZ3MtPmVwYywKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiT29wcyAtIGNvbnRyb2wgZmxvdyB2aW9sYXRpb24iKTsKPiA+ID4gPiArICAgICAgICAgICAg
ICAgcmV0dXJuIHRydWU7Cj4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPiA+ICsvKgo+ID4gPiA+
ICsgKiBzb2Z0d2FyZSBjaGVjayBleGNlcHRpb24gaXMgZGVmaW5lZCB3aXRoIHJpc2MtdiBjZmkg
c3BlYy4gU29mdHdhcmUgY2hlY2sKPiA+ID4gPiArICogZXhjZXB0aW9uIGlzIHJhaXNlZCB3aGVu
Oi0KPiA+ID4gPiArICogYSkgQW4gaW5kaXJlY3QgYnJhbmNoIGRvZXNuJ3QgbGFuZCBvbiA0IGJ5
dGUgYWxpZ25lZCBQQyBvciBgbHBhZGAKPiA+ID4gPiArICogICAgaW5zdHJ1Y3Rpb24gb3IgYGxh
YmVsYCB2YWx1ZSBwcm9ncmFtbWVkIGluIGBscGFkYCBpbnN0ciBkb2Vzbid0Cj4gPiA+ID4gKyAq
ICAgIG1hdGNoIHdpdGggdmFsdWUgc2V0dXAgaW4gYHg3YC4gcmVwb3J0ZWQgY29kZSBpbiBgeHR2
YWxgIGlzIDIuCj4gPiA+ID4gKyAqIGIpIGBzc3BvcGNoa2AgaW5zdHJ1Y3Rpb24gZmluZHMgYSBt
aXNtYXRjaCBiZXR3ZWVuIHRvcCBvZiBzaGFkb3cgc3RhY2sgKHNzcCkKPiA+ID4gPiArICogICAg
YW5kIHgxL3g1LiByZXBvcnRlZCBjb2RlIGluIGB4dHZhbGAgaXMgMy4KPiA+ID4gPiArICovCj4g
PiA+ID4gK2FzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9z
b2Z0d2FyZV9jaGVjayhzdHJ1Y3QgcHRfcmVncyAqcmVncykKPiA+ID4gPiArewo+ID4gPiA+ICsg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4gPiA+ICsgICAgICAgICAgICAgICBpcnFl
bnRyeV9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAg
ICAgICAgICAgIC8qIG5vdCBhIGNmaSB2aW9sYXRpb24sIHRoZW4gbWVyZ2UgaW50byBmbG93IG9m
IHVua25vd24gdHJhcCBoYW5kbGVyICovCj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmICghaGFu
ZGxlX3VzZXJfY2ZpX3Zpb2xhdGlvbihyZWdzKSkKPiA+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBkb190cmFwX3Vua25vd24ocmVncyk7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICAgICAgICAg
ICAgICBpcnFlbnRyeV9leGl0X3RvX3VzZXJfbW9kZShyZWdzKTsKPiA+ID4gPiArICAgICAgIH0g
ZWxzZSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qIHN3IGNoZWNrIGV4Y2VwdGlvbiBjb21p
bmcgZnJvbSBrZXJuZWwgaXMgYSBidWcgaW4ga2VybmVsICovCj4gPiA+ID4gKyAgICAgICAgICAg
ICAgIGRpZShyZWdzLCAiS2VybmVsIEJVRyIpOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICt9
Cj4gPiA+ID4gKwo+ID4gPiA+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4gPiA+ICBhc21saW5rYWdl
IF9fdmlzaWJsZSBub2luc3RyIHZvaWQgZG9fcGFnZV9mYXVsdChzdHJ1Y3QgcHRfcmVncyAqcmVn
cykKPiA+ID4gPiAgewo+ID4gPiA+Cj4gPiA+ID4gLS0KPiA+ID4gPiAyLjQzLjAKPiA+ID4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
