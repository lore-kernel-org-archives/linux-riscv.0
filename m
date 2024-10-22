Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8828D1CDD3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 10:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWYM2T+yy5FOa+0NtOzUlcpc5x77FWV/Nq52eZ/H7Xk=; b=4z8+ihOdsUJaFa4QgoSuK3e+CE
	kR2gtBtV9klvrlRGw1DGdvYXpMfyWjI6fXT71vzeQwqcmzgPhRgBE2NxGuXcij/8ymeDbZym9jDYE
	cN10mVuChu3cZ+X7mvZpju++bFgmnJdEjQBrfs+0NJwPShvPClPqSUbakwGr3hsth2N8y+Q/FyNpF
	o82IPb2BqZKFRNj0FHnXIaPR+sdRqlo/wqzDY8VmICUy4pjttl5sua4raUNVQpGV347kzG2B3LW53
	Of1m11tBozpUaY2B9BariR+DbA2wHYR8P90qWZ6VcdQ91zN/wasFp/NdLZrrUSA9qt6HJiojniRAD
	aPhv7WfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3C3p-0000000AW5e-19ln;
	Tue, 22 Oct 2024 10:24:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3C1W-0000000AViq-2kqO
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 10:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 189E55C5D49;
	Tue, 22 Oct 2024 10:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D8CC4CEC3;
	Tue, 22 Oct 2024 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729592517;
	bh=AV2qizbKg6OBYja0QTKSFQnNhoDGuy4QLCP1NAfZPuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q0Dwv2E4cQ9aPHZAyd6T9O5nTw+cwk7rYh7yOVSiJzLLMGVxPKzzbarWuahcbHEDz
	 kpyFs/kEdSzA7cD8chrCYxE8lyuDpgOiVUDgF4IRySbhcYGhxmyk3wzKrYEpoNbkCK
	 uXW/uTjWgQCkFUbbOmDkvJES44yYCBDii+4ImiW8Mup/HQx9mpyUUINZfVdFIXt7Aw
	 0QUQdMwzUQhkGtHZjur0RcR2le86yOAsbGiwfZCo+xXhFfBsAxxGkS6+uvTakgnWuZ
	 M2YkLweov6J1Un7ac1n+DjCOepl5y2Ep3/5j0LiopQt5lSZKxtKNN2YuZT2GQfrKBp
	 sfC1pRJkvbWLA==
From: Puranjay Mohan <puranjay@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Andrii Nakryiko
 <andrii@kernel.org>, bpf@vger.kernel.org, Daniel Borkmann
 <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Eduard
 Zingerman <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>, Hao Luo
 <haoluo@google.com>, Helge Deller <deller@gmx.de>, Jakub Kicinski
 <kuba@kernel.org>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>,
 Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, Palmer Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Song Liu
 <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Yonghong Song
 <yonghong.song@linux.dev>
Subject: Re: [PATCH bpf-next 4/5] selftests/bpf: Add benchmark for
 bpf_csum_diff() helper
In-Reply-To: <CAEf4BzY1LgCF1VOoAQkMdDTx87C0mfyftMvhvVU4GpsFc6fw5g@mail.gmail.com>
References: <20241021122112.101513-1-puranjay@kernel.org>
 <20241021122112.101513-5-puranjay@kernel.org>
 <CAEf4BzY1LgCF1VOoAQkMdDTx87C0mfyftMvhvVU4GpsFc6fw5g@mail.gmail.com>
Date: Tue, 22 Oct 2024 10:21:43 +0000
Message-ID: <mb61pa5ewbfpk.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_032158_807653_6407CB53 
X-CRM114-Status: GOOD (  26.13  )
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
Content-Type: multipart/mixed; boundary="===============1306268455774716765=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1306268455774716765==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andrii Nakryiko <andrii.nakryiko@gmail.com> writes:

> On Mon, Oct 21, 2024 at 5:22=E2=80=AFAM Puranjay Mohan <puranjay@kernel.o=
rg> wrote:
>>
>> Add a microbenchmark for bpf_csum_diff() helper. This benchmark works by
>> filling a 4KB buffer with random data and calculating the internet
>> checksum on different parts of this buffer using bpf_csum_diff().
>>
>> Example run using ./benchs/run_bench_csum_diff.sh on x86_64:
>>
>> [bpf]$ ./benchs/run_bench_csum_diff.sh
>> 4                    2.296 =C2=B1 0.066M/s (drops 0.000 =C2=B1 0.000M/s)
>> 8                    2.320 =C2=B1 0.003M/s (drops 0.000 =C2=B1 0.000M/s)
>> 16                   2.315 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>> 20                   2.318 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>> 32                   2.308 =C2=B1 0.003M/s (drops 0.000 =C2=B1 0.000M/s)
>> 40                   2.300 =C2=B1 0.029M/s (drops 0.000 =C2=B1 0.000M/s)
>> 64                   2.286 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>> 128                  2.250 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>> 256                  2.173 =C2=B1 0.001M/s (drops 0.000 =C2=B1 0.000M/s)
>> 512                  2.023 =C2=B1 0.055M/s (drops 0.000 =C2=B1 0.000M/s)
>
> you are not benchmarking bpf_csum_diff(), you are benchmarking how
> often you can call bpf_prog_test_run(). Add some batching on the BPF
> side, these numbers tell you that there is no difference between
> calculating checksum for 4 bytes and for 512, that didn't seem strange
> to you?

This didn't seem strange to me because if you see the tables I added to
the cover letter, there is a clear improvement after optimizing the
helper and arm64 even shows a linear drop going from 4 bytes to 512
bytes, even after the optimization.

On x86 after the improvement, 4 bytes and 512 bytes show similar numbers
but there is still a small drop that can be seen going from 4 to 512
bytes.

My thought was that because the bpf_csum_diff() calls csum_partial() on
x86 which is already optimised, most of the overhead was due to copying
the buffer which is now removed.

I guess I can amplify the difference between 4B and 512B by calling
bpf_csum_diff() multiple times in a loop, or by calculating the csum by
dividing the buffer into more parts (currently the BPF code divides it
into 2 parts only).

>>
>> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
>> ---
>>  tools/testing/selftests/bpf/Makefile          |   2 +
>>  tools/testing/selftests/bpf/bench.c           |   4 +
>>  .../selftests/bpf/benchs/bench_csum_diff.c    | 164 ++++++++++++++++++
>>  .../bpf/benchs/run_bench_csum_diff.sh         |  10 ++
>>  .../selftests/bpf/progs/csum_diff_bench.c     |  25 +++
>>  5 files changed, 205 insertions(+)
>>  create mode 100644 tools/testing/selftests/bpf/benchs/bench_csum_diff.c
>>  create mode 100755 tools/testing/selftests/bpf/benchs/run_bench_csum_di=
ff.sh
>>  create mode 100644 tools/testing/selftests/bpf/progs/csum_diff_bench.c
>>
>
> [...]
>
>> +
>> +static void csum_diff_setup(void)
>> +{
>> +       int err;
>> +       char *buff;
>> +       size_t i, sz;
>> +
>> +       sz =3D sizeof(ctx.skel->rodata->buff);
>> +
>> +       setup_libbpf();
>> +
>> +       ctx.skel =3D csum_diff_bench__open();
>> +       if (!ctx.skel) {
>> +               fprintf(stderr, "failed to open skeleton\n");
>> +               exit(1);
>> +       }
>> +
>> +       srandom(time(NULL));
>> +       buff =3D ctx.skel->rodata->buff;
>> +
>> +       /*
>> +        * Set first 8 bytes of buffer to 0xdeadbeefdeadbeef, this is la=
ter used to verify the
>> +        * correctness of the helper by comparing the checksum result fo=
r 0xdeadbeefdeadbeef that
>> +        * should be 0x3b3b
>> +        */
>> +
>> +       *(u64 *)buff =3D 0xdeadbeefdeadbeef;
>> +
>> +       for (i =3D 8; i < sz; i++)
>> +               buff[i] =3D '1' + random() % 9;
>
> so, you only generate 9 different values for bytes, why? Why not full
> byte range?

Thanks for catching this, there is no reason for this to be [1,10] I
will use the full byte range in the next version.

Thanks,
Puranjay

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIoEARYKADIWIQQ3wHGvVs/5bdl78BKwwPkjG3B2nQUCZxd8uBQccHVyYW5qYXlA
a2VybmVsLm9yZwAKCRCwwPkjG3B2naqLAP4gJRI2rNegFDPIetTizylOYrKkxJvb
l6VHS1KEhetaqgEA2sTZjU7iKb6CxVDKnGjxvZfB+i7/KLqo8wHt7XSUDQU=
=7l8n
-----END PGP SIGNATURE-----
--=-=-=--


--===============1306268455774716765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1306268455774716765==--

