From: jhogan@kernel.org (James Hogan)
Date: Wed, 4 Apr 2018 23:02:58 +0100
Subject: [PATCH v5 2/3] lib: Rename compiler intrinsic selects to
 GENERIC_LIB_*
In-Reply-To: <mhng-58affcc9-9eff-4403-861e-e40aea063afc@palmer-si-x1c4>
References: <1522747466-22081-2-git-send-email-matt.redfearn@mips.com>
 <mhng-58affcc9-9eff-4403-861e-e40aea063afc@palmer-si-x1c4>
Message-ID: <20180404220258.GA9347@saruman>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, Apr 03, 2018 at 03:39:34PM -0700, Palmer Dabbelt wrote:
> Sorry, I'm not sure if this is the right patch -- someone suggested acking 
> this, but it's already Review-By me and if I understand correctly it's going 
> through your tree.  I'm a bit new to this, but if it helps then here's a
> 
> Acked-By: Palmer Dabbelt <palmer@sifive.com>

Thanks Palmer.

No worries. FYI Documentation/process/submitting-patches.rst appears to
now contain lots of gory detail about what Acked-by and Reviewed-by are
supposed to mean.

In this case an acked-by is needed to show your approval of the parts of
the patch which touch the subsystem you are responsible for (and/or code
which you have authored) so that the patch can go via another tree. It
usually indicates that you've reviewed those parts of the patch too, but
not necessarily the whole thing.

Cheers
James
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-riscv/attachments/20180404/a1a0d519/attachment.sig>
